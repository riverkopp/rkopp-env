#!/usr/bin/env bash

. "$(dirname "${BASH_SOURCE[0]}")/profile.sh"
PROFILE="$(machine_profile ./etc/profile.txt)"

# If Visual Studio Code install list bash script exists, remove it
if [ -f "./lists/vsc_install_list.sh" ] ; then
    rm "./lists/vsc_install_list.sh"
fi

# If Visual Studio Code install list PowerShell script exists, remove it
if [ -f "./lists/vsc_install_list.ps1" ] ; then
    rm "./lists/vsc_install_list.ps1"
fi

# Get all current VSCode extensions and dump them to both files
echo "#!/bin/bash" >> ./lists/vsc_install_list.sh
echo "#!/usr/bin/env pwsh" >> ./lists/vsc_install_list.ps1
echo "" >> ./lists/vsc_install_list.ps1
echo "# Install all VSCode extensions from the list" >> ./lists/vsc_install_list.ps1
code --list-extensions | while read -r ext; do
    echo "code --install-extension $ext" >> ./lists/vsc_install_list.sh
    echo "code --install-extension $ext" >> ./lists/vsc_install_list.ps1
done

# If Brewfile exists, rename it to Brewfile.old
if [ -f "./lists/Brewfile" ] ; then
    mv "./lists/Brewfile" "./lists/Brewfile.old"
fi

# Go to ./lists directory
cd ./lists || exit

# Generate a Brewfile
brew update
brew upgrade
brew bundle dump

# If the dump produced nothing usable, put the old Brewfile back and stop
if [ ! -s "./Brewfile" ] ; then
    echo "ERROR: Brewfile generation failed or produced an empty file."
    if [ -f "./Brewfile.old" ] ; then
        mv "./Brewfile.old" "./Brewfile"
        echo "Restored original Brewfile."
    fi
    exit 1
fi

# "type name" for every entry, so that `tap "x"` and `tap "x", trusted: true`
# compare as the same entry.
entry_keys() {
    sed -nE 's/^(tap|brew|cask|vscode|go|npm|whalebrew) "([^"]+)".*/\1 \2/p' "$1"
}

# Print one entry, plus the description comment above it, from a Brewfile.
entry_line() {
    awk -v pfx="$1 \"$2\"" '
        /^#/ { comment = $0; next }
        substr($0, 1, length(pfx)) == pfx &&
        (length($0) == length(pfx) || substr($0, length(pfx) + 1, 1) == ",") {
            if (comment != "") print comment
            print
            exit
        }
        { comment = "" }
    ' "$3"
}

# Rewrite $1 without any entry whose "type name" key is listed in file $2,
# dropping each one's description comment with it.
remove_entries() {
    [ -f "$1" ] || return 0
    awk -v keyfile="$2" '
        BEGIN { while ((getline k < keyfile) > 0) if (k != "") drop[k] = 1 }
        /^#/ { if (comment != "") print comment; comment = $0; next }
        {
            if (match($0, /^[a-z]+ "[^"]+"/)) {
                key = substr($0, RSTART, RLENGTH)
                gsub(/"/, "", key)
                if (key in drop) { comment = ""; next }
            }
            if (comment != "") { print comment; comment = "" }
            print
        }
        END { if (comment != "") print comment }
    ' "$1" > "$1.new" && mv "$1.new" "$1"
}

# Strip the carried-forward header written by the last run. Its final comment
# line sits directly above the first carried entry, so entry_line would copy it
# out as if it were that package's description, and the block would grow a
# duplicate line on every sync.
if [ -f "./Brewfile.old" ] ; then
    awk '/^# --- carried forward/ { skip = 1 ; next }
         skip && /^#/            { next }
         { skip = 0 ; print }' ./Brewfile.old > ./Brewfile.tmp \
        && mv ./Brewfile.tmp ./Brewfile.old
fi

# What is installed on this machine right now, straight from the dump. Saved at
# the end of the run and compared on the next one, so a package you deliberately
# uninstalled can be told apart from one that was never installed here.
snapshot="../etc/installed.txt"
installed_now=$(entry_keys ./Brewfile | sort -u)

# Packages that belong to only one kind of machine. `make fresh` installs the
# file matching etc/profile.txt on top of the standard Brewfile and ignores the
# other one, so neither list can leak onto the wrong machine.
PROFILE_FILES=(./Brewfile.personal ./Brewfile.professional)
ACTIVE_PROFILE="./Brewfile.$PROFILE"

# Homebrew keeps a disabled package working once it is installed, so
# `brew bundle dump` writes it straight back out -- but a fresh machine can
# never install it again, and every `make fresh` would report it as a failure
# forever. Drop those. If the lookup fails, leave the Brewfile as dumped.
# `brew info` resolves every name in one call and fails the whole call if even
# one of them is unavailable, a formula from a tap this machine does not have,
# say. So ask only about the lists that apply here. The other profile's taps
# are not tapped on this machine, and including its names aborted the lookup
# and skipped this pruning without a word.
info=$(sed -nE 's/^(brew|cask) "([^"]+)".*/\2/p' ./Brewfile ./Brewfile.old "$ACTIVE_PROFILE" 2>/dev/null \
       | sort -u | xargs brew info --json=v2 2>/dev/null)

disabled=""
if [ -z "$info" ] ; then
    echo "Warning: brew info resolved none of the tracked names, so nothing was checked for being disabled."
else
    disabled=$(jq -r '(.formulae[] | select(.disabled) | .full_name),
                      (.casks[]    | select(.disabled) | .token)' <<< "$info" 2>/dev/null)
fi

disabled_keys=""
while IFS= read -r pkg ; do
    [ -n "$pkg" ] || continue
    echo "Dropping \"$pkg\": disabled by Homebrew, cannot be installed on a fresh machine."
    disabled_keys+="brew $pkg"$'\n'"cask $pkg"$'\n'
done <<< "$disabled"

# Same rule as the uninstall check below: only this machine's own lists get
# rewritten. The other profile's list is judged on the machine it belongs to.
if [ -n "$disabled_keys" ] ; then
    remove_entries ./Brewfile <(printf '%s' "$disabled_keys")
    remove_entries "$ACTIVE_PROFILE" <(printf '%s' "$disabled_keys")
fi

# ----------------------------------------------------- which machines get it

# The dump lists everything installed here, including the packages meant for
# only this kind of machine, so those have to be pulled back out or they end up
# in the file every machine installs. Anything installed here that no file
# tracks yet is new, so ask where it belongs once and record the answer.
profile_keys=$(for f in "${PROFILE_FILES[@]}" ; do
                   entry_keys "$f" 2>/dev/null
               done | sort -u)

# Read the file rather than $installed_now, so a package the pruning above just
# dropped is not offered as new a few lines later.
new_keys=$(comm -23 <(entry_keys ./Brewfile | sort -u) \
                    <(cat <(entry_keys ./Brewfile.old 2>/dev/null) \
                          <(printf '%s\n' "$profile_keys") | sort -u))
new_keys=$(grep . <<< "$new_keys")

if [ -n "$new_keys" ] ; then
    if [ -r /dev/tty ] && [ -t 1 ] ; then
        echo ""
        echo "==> New on this machine and not tracked yet"
        echo ""
        while IFS= read -r key ; do
            printf '  %s\n' "$(entry_line "${key%% *}" "${key#* }" ./Brewfile | tail -1)"
            printf '    [enter] every machine   [p] personal only   [w] work only   > '
            read -r reply < /dev/tty
            case "$reply" in
                p|P|personal)     target=./Brewfile.personal ;;
                w|W|professional) target=./Brewfile.professional ;;
                *)                target="" ;;
            esac
            if [ -n "$target" ] ; then
                entry_line "${key%% *}" "${key#* }" ./Brewfile >> "$target"
                profile_keys+=$'\n'"$key"
                echo "    -> $target"
            else
                echo "    -> Brewfile"
            fi
        done <<< "$new_keys"
        echo ""
    else
        echo "Not a terminal, so $(grep -c . <<< "$new_keys") new entries went to the standard Brewfile."
        echo "Re-run \`make sync\` from a terminal to move any of these to a profile list:"
        sed 's/^/  /' <<< "$new_keys"
    fi
fi

# Those entries are tracked in their own file, so keep them out of this one.
if [ -n "$profile_keys" ] ; then
    remove_entries ./Brewfile <(printf '%s\n' "$profile_keys")
fi

# A package in this machine's own profile list that was installed at the last
# sync and is gone now was uninstalled on purpose, same rule as below. The other
# profile's list is never touched here: its packages are not supposed to be
# installed on this machine, so their absence says nothing.
if [ -s "$snapshot" ] && [ -f "$ACTIVE_PROFILE" ] ; then
    gone=$(comm -23 <(comm -12 <(entry_keys "$ACTIVE_PROFILE" | sort -u) <(sort -u "$snapshot")) \
                    <(printf '%s\n' "$installed_now"))
    gone=$(grep . <<< "$gone")
    if [ -n "$gone" ] ; then
        while IFS= read -r key ; do
            echo "Dropping \"${key#* }\" from $ACTIVE_PROFILE: installed at the last sync and gone now."
        done <<< "$gone"
        remove_entries "$ACTIVE_PROFILE" <(printf '%s\n' "$gone")
    fi
fi

# --------------------------------------------------------------- carry forward

# `brew bundle dump` records only what is installed right now, so anything that
# failed to install on the last `make fresh` -- a cask whose CDN reset the
# connection mid-download, say -- would silently vanish from the tracked list.
# Carry those forward so the Brewfile stays the full intended set and the next
# `make fresh` retries them.
#
# A package you uninstalled on purpose looks identical in the dump, so the
# snapshot from the last run breaks the tie: it was installed here then and it
# is gone now, which no failed install can produce. Drop those instead.
if [ -f "./Brewfile.old" ] ; then
    carried=$(comm -23 <(entry_keys ./Brewfile.old | sort -u) \
                       <(entry_keys ./Brewfile | sort -u) \
              | while IFS= read -r key ; do
                    grep -qxF "${key#* }" <<< "$disabled" && continue
                    grep -qxF "$key" <<< "$profile_keys" && continue
                    if [ -s "$snapshot" ] && grep -qxF "$key" "$snapshot" ; then
                        echo "Dropping \"${key#* }\": installed at the last sync and gone now, so it was uninstalled on purpose." >&2
                        continue
                    fi
                    echo "$key"
                done)

    if [ -n "$carried" ] ; then
        {
            echo ""
            echo "# --- carried forward ---------------------------------------------------"
            echo "# Tracked here but not installed on this machine, so \`brew bundle dump\`"
            echo "# left them out. Kept so a failed install cannot quietly drop a package"
            echo "# from the list; \`make fresh\` picks them up on the next run."
            while IFS= read -r key ; do
                entry_line "${key%% *}" "${key#* }" ./Brewfile.old
            done <<< "$carried"
        } >> ./Brewfile
        echo "Carried forward $(grep -c . <<< "$carried") entries not installed on this machine."
    fi
fi

if [ ! -s "$snapshot" ] ; then
    echo "Recording what is installed here for the first time; from the next \`make sync\` on,"
    echo "anything you uninstall gets dropped from the Brewfile instead of carried forward."
fi
printf '%s\n' "$installed_now" > "$snapshot"

rm -f "./Brewfile.old"
