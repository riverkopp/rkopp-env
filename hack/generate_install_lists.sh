#!/usr/bin/env bash

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

# Remove one brew/cask entry, and the description comment above it.
drop_entry() {
    awk -v name="$1" '
        /^#/ { if (comment != "") print comment; comment = $0; next }
        {
            pfx = ($0 ~ /^cask /) ? "cask \"" name "\"" : "brew \"" name "\""
            if (substr($0, 1, length(pfx)) == pfx &&
                (length($0) == length(pfx) || substr($0, length(pfx) + 1, 1) == ",")) {
                comment = ""
                next
            }
            if (comment != "") { print comment; comment = "" }
            print
        }
        END { if (comment != "") print comment }
    ' ./Brewfile > ./Brewfile.new && mv ./Brewfile.new ./Brewfile
}

# Homebrew keeps a disabled package working once it is installed, so
# `brew bundle dump` writes it straight back out -- but a fresh machine can
# never install it again, and every `make fresh` would report it as a failure
# forever. Drop those. If the lookup fails, leave the Brewfile as dumped.
disabled=$(sed -nE 's/^(brew|cask) "([^"]+)".*/\2/p' ./Brewfile ./Brewfile.old 2>/dev/null \
           | sort -u | xargs brew info --json=v2 2>/dev/null \
           | jq -r '(.formulae[] | select(.disabled) | .full_name),
                    (.casks[]    | select(.disabled) | .token)' 2>/dev/null)

while IFS= read -r pkg ; do
    [ -n "$pkg" ] || continue
    echo "Dropping \"$pkg\": disabled by Homebrew, cannot be installed on a fresh machine."
    drop_entry "$pkg"
done <<< "$disabled"

# `brew bundle dump` records only what is installed right now, so anything that
# failed to install on the last `make fresh` -- a cask whose CDN reset the
# connection mid-download, say -- would silently vanish from the tracked list.
# Carry those forward so the Brewfile stays the full intended set and the next
# `make fresh` retries them.
if [ -f "./Brewfile.old" ] ; then
    carried=$(comm -23 <(entry_keys ./Brewfile.old | sort -u) \
                       <(entry_keys ./Brewfile | sort -u) \
              | while IFS= read -r key ; do
                    grep -qxF "${key#* }" <<< "$disabled" || echo "$key"
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

rm -f "./Brewfile.old"
