#!/usr/bin/env bash

set -uo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BREWFILE="$REPO_ROOT/lists/Brewfile"
BUNDLE_ATTEMPTS="${BUNDLE_ATTEMPTS:-3}"

# Third-party CDNs (chef.io, waterfox, virtualbox, okta) reset connections when
# Homebrew's default concurrency (2x CPU cores) hits them all at once, which
# surfaces as `curl: (92) HTTP/2 PROTOCOL_ERROR` on random casks each run.
export HOMEBREW_DOWNLOAD_CONCURRENCY="${HOMEBREW_DOWNLOAD_CONCURRENCY:-4}"
export HOMEBREW_CURL_RETRIES="${HOMEBREW_CURL_RETRIES:-3}"
export HOMEBREW_NO_ENV_HINTS=1

bold=$(tput bold 2>/dev/null || true)
red=$(tput setaf 1 2>/dev/null || true)
yellow=$(tput setaf 3 2>/dev/null || true)
green=$(tput setaf 2 2>/dev/null || true)
reset=$(tput sgr0 2>/dev/null || true)

# ---------------------------------------------------------------- install brew

if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# The installer does not touch the current shell's PATH, so put brew on it
# before the bundle step runs.
for candidate in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    [ -x "$candidate" ] && eval "$("$candidate" shellenv)" && break
done

if ! command -v brew >/dev/null 2>&1; then
    echo "${red}ERROR:${reset} brew is not on PATH after install; cannot continue." >&2
    exit 1
fi

# ----------------------------------------------------------------- preflight

# A tap without `trusted: true` makes brew refuse to load its formulae, and
# brew bundle then reports EVERY entry as failed rather than just that tap's.
# Catch it up front instead of after a 20-minute run.
untrusted=$(grep -E '^tap "' "$BREWFILE" | grep -v 'trusted:' \
            | sed -E 's/^tap "([^"]+)".*/\1/' | grep -v '^homebrew/' || true)

if [ -n "$untrusted" ]; then
    echo "${yellow}${bold}==> Warning: untrusted taps in the Brewfile${reset}"
    echo ""
    echo "  brew refuses to load formulae from these, which makes the whole"
    echo "  bundle report as failed. Trust them first if you use their formulae:"
    echo ""
    while IFS= read -r t; do echo "    brew trust $t"; done <<<"$untrusted"
    echo ""
fi

# ------------------------------------------------------------------- run bundle

# Retry the whole bundle: a run that fails purely on transient CDN errors will
# usually complete on a second pass, and the last pass drops to serial downloads
# so the flakiest casks get a clean shot.
for attempt in $(seq 1 "$BUNDLE_ATTEMPTS"); do
    echo ""
    echo "${bold}==> brew bundle (attempt ${attempt}/${BUNDLE_ATTEMPTS})${reset}"
    if [ "$attempt" -eq "$BUNDLE_ATTEMPTS" ]; then
        HOMEBREW_DOWNLOAD_CONCURRENCY=1 brew bundle --file="$BREWFILE" -v && break
    else
        brew bundle --file="$BREWFILE" -v && break
    fi
    echo "${yellow}==> bundle incomplete; retrying after 10s${reset}"
    sleep 10
done

# VSCode extensions are `vscode "..."` entries in the Brewfile, so the bundle
# above already installed them. lists/vsc_install_list.ps1 still exists for
# Windows, which has no brew.

# ---------------------------------------------------------------- diagnose gaps

# Classify each still-missing entry so the run ends with a reason and a command
# instead of a bare "Installing <x> has failed!".
diagnose() {
    local kind="$1" name="$2" flag="" info rc

    case "$kind" in
        Cask) flag="--cask" ;;
        Formula) flag="--formula" ;;
        Tap)
            REASON="Tap is unreachable, private, or no longer exists"
            ACTION="brew tap $name   # if this fails, drop the tap and anything using it from lists/Brewfile"
            case "$name" in
                homebrew/core|homebrew/cask)
                    REASON="Built into Homebrew; the Brewfile line is a stale 'brew bundle dump' artifact"
                    ACTION="Remove 'tap \"$name\"' from lists/Brewfile" ;;
            esac
            return ;;
        "Go Package")
            REASON="go install failed (go missing from PATH during the run, or the module is unreachable)"
            ACTION="go install ${name}@latest"
            return ;;
        "npm Package")
            REASON="npm/node was not on PATH when the bundle ran"
            ACTION="brew install node && npm install -g $name"
            return ;;
    esac

    info=$(brew info $flag "$name" 2>&1); rc=$?

    if [ $rc -ne 0 ]; then
        case "$name" in
            */*) REASON="Its tap (${name%/*}) is unreachable, private, or does not exist"
                 ACTION="brew tap ${name%/*}   # then re-run, or drop this line from lists/Brewfile" ;;
            *)   REASON="No longer exists in Homebrew (renamed or removed)"
                 ACTION="brew search $name   # find the replacement, then update lists/Brewfile" ;;
        esac
        return
    fi

    # Homebrew labels a formula "Deprecated because ... It was disabled on <date>"
    # once removal lands, so the disabled date — not the prefix — decides whether
    # a reinstall can still succeed.
    if grep -qE "^(Disabled|Deprecated) because" <<<"$info"; then
        REASON=$(grep -m1 -E "^(Disabled|Deprecated) because" <<<"$info")
        if grep -q "It was disabled on" <<<"$REASON"; then
            ACTION="Not installable by Homebrew. Remove from lists/Brewfile and install manually if you still need it."
        else
            ACTION="HOMEBREW_DOWNLOAD_CONCURRENCY=1 brew install $flag $name   # still installable, but plan a replacement"
        fi
        return
    fi

    REASON="Download or install failed, usually a transient CDN/network error under parallel downloads"
    ACTION="HOMEBREW_DOWNLOAD_CONCURRENCY=1 brew install $flag $name"
}

echo ""
echo "${bold}==> Verifying Brewfile${reset}"

check_out=$(brew bundle check --file="$BREWFILE" --verbose 2>&1)

# Lines look like: "→ Cask zed needs to be installed or updated."
missing=$(grep -E '^(→|->) .+ needs to be' <<<"$check_out" \
          | sed -E 's/^(→|->) //; s/ needs to be.*$//')

if [ -z "$missing" ]; then
    echo "${green}All Brewfile entries are installed.${reset}"
    exit 0
fi

total=$(grep -c . <<<"$missing")

echo ""
echo "${bold}${red}${total} Brewfile entr$([ "$total" -eq 1 ] && echo y || echo ies) still missing${reset}"
echo ""

retry_formulae=()
retry_casks=()

while IFS= read -r entry; do
    case "$entry" in
        "Go Package "*)  kind="Go Package";  name=${entry#Go Package } ;;
        "npm Package "*) kind="npm Package"; name=${entry#npm Package } ;;
        *) kind=${entry%% *}; name=${entry#* } ;;
    esac

    diagnose "$kind" "$name"

    printf '  %s%s%s (%s)\n' "$bold" "$name" "$reset" "$(tr '[:upper:]' '[:lower:]' <<<"$kind")"
    printf '    why: %s\n' "$REASON"
    printf '    fix: %s\n\n' "$ACTION"

    if [[ $ACTION == HOMEBREW_DOWNLOAD_CONCURRENCY* ]]; then
        if [ "$kind" = Cask ]; then retry_casks+=("$name"); else retry_formulae+=("$name"); fi
    fi
done <<<"$missing"

if [ $(( ${#retry_casks[@]} + ${#retry_formulae[@]} )) -gt 0 ]; then
    echo "${bold}Retry the recoverable failures:${reset}"
    echo ""
    [ ${#retry_formulae[@]} -gt 0 ] && \
        echo "  HOMEBREW_DOWNLOAD_CONCURRENCY=1 brew install --formula ${retry_formulae[*]}"
    [ ${#retry_casks[@]} -gt 0 ] && \
        echo "  HOMEBREW_DOWNLOAD_CONCURRENCY=1 brew install --cask ${retry_casks[*]}"
    echo ""
fi

echo "${bold}Then re-verify:${reset}"
echo ""
echo "  make fresh    # safe to re-run; installed entries are skipped"
echo ""
