#!/usr/bin/env bash
#
# Bootstrap a fork of this repo: replace the previous owner's career content
# with the templates in docs/templates/, and point the README at your fork.
#
# This is destructive. It deletes every submitted resume, prospective draft,
# writing, and generated PDF in the working tree. Run it once, right after
# cloning your fork, and never again.
#
# Usage:
#   make init            # prompts before deleting anything
#   make init FORCE=1    # no prompt, for scripted setup

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

FORCE="${FORCE:-0}"

MASTERS=(PERSONAL_details ats linkedin STAR_questions TAILORING_rules visual)
CLEAR_DIRS=(docs/submitted docs/prospectives docs/writings docs/pdf etc)

bold() { printf '\033[1m%s\033[0m\n' "$1"; }
warn() { printf '\033[33m%s\033[0m\n' "$1"; }

# --- Preflight ---------------------------------------------------------------

if [[ ! -d docs/templates ]]; then
  echo "Error: docs/templates/ not found. Are you in the repo root?" >&2
  exit 1
fi

for m in "${MASTERS[@]}"; do
  if [[ ! -f "docs/templates/${m}.template.md" ]]; then
    echo "Error: missing docs/templates/${m}.template.md" >&2
    exit 1
  fi
done

# Count what would be destroyed so the prompt states real numbers.
doomed=0
for d in "${CLEAR_DIRS[@]}"; do
  [[ -d "$d" ]] || continue
  n=$(find "$d" -mindepth 1 -type f ! -name '.gitkeep' | wc -l | tr -d ' ')
  doomed=$((doomed + n))
done

# --- Plan --------------------------------------------------------------------

bold "make init will:"
echo "  1. Copy docs/templates/*.template.md over docs/masters/ (${#MASTERS[@]} files)"
echo "  2. Reset profile.env from docs/templates/profile.env.example"
echo "  3. Delete all content under: ${CLEAR_DIRS[*]}"
echo "  4. Repoint README URLs at your fork's origin remote"
echo
if (( doomed > 0 )); then
  warn "This deletes ${doomed} file(s) of someone's career history."
  warn "If this is your own established repo rather than a fresh fork, stop now."
  echo
fi

if [[ "$FORCE" != "1" ]]; then
  printf 'Type "init" to continue: '
  read -r reply || reply=""
  if [[ "$reply" != "init" ]]; then
    echo "Aborted. Nothing changed."
    exit 0
  fi
  echo
fi

# --- 1. Masters --------------------------------------------------------------

mkdir -p docs/masters
for m in "${MASTERS[@]}"; do
  cp "docs/templates/${m}.template.md" "docs/masters/${m}.md"
  echo "  reset  docs/masters/${m}.md"
done

# --- 2. profile.env ----------------------------------------------------------

# profile.env has to be committed, since the CI workflow sources it, which means
# a fork inherits the previous owner's identity. Reset it unconditionally; this
# is the single most important file for init to clear.
cp docs/templates/profile.env.example profile.env
echo "  reset  profile.env"

# --- 3. Clear generated and personal content ---------------------------------

for d in "${CLEAR_DIRS[@]}"; do
  [[ -d "$d" ]] || continue
  find "$d" -mindepth 1 ! -name '.gitkeep' -delete 2>/dev/null || true
  echo "  clear  ${d}/"
done

# Keep the directories tracked so a fresh clone has somewhere to write.
for d in docs/prospectives docs/pdf docs/submitted docs/writings etc; do
  mkdir -p "$d"
  [[ -e "$d/.gitkeep" ]] || touch "$d/.gitkeep"
done

# --- 4. Repoint README at the fork -------------------------------------------

remote="$(git remote get-url origin 2>/dev/null || true)"
if [[ -z "$remote" ]]; then
  warn "  skip   README URLs (no origin remote)"
else
  # Accept both git@github.com:owner/repo.git and https://github.com/owner/repo.git
  slug="$(printf '%s' "$remote" | sed -E 's#^.*github\.com[:/]##; s#\.git$##')"
  owner="${slug%%/*}"
  repo="${slug##*/}"
  if [[ -z "$owner" || -z "$repo" || "$slug" != */* ]]; then
    warn "  skip   README URLs (could not parse '$remote')"
  else
    old_slug="$(grep -oE '[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+/actions' README.md | head -1 | sed 's#/actions##' || true)"
    if [[ -n "$old_slug" && "$old_slug" != "$slug" ]]; then
      old_repo="${old_slug##*/}"
      sed -i.bak "s#${old_slug}#${slug}#g; s#\b${old_repo}\b#${repo}#g" README.md && rm -f README.md.bak
      echo "  update README.md URLs: ${old_slug} -> ${slug}"
    else
      echo "  ok     README.md URLs already point at ${slug}"
    fi
  fi
fi

# --- Next steps --------------------------------------------------------------

echo
bold "Done. Next:"
cat <<'NEXT'
  1. Edit profile.env           - PDF_SLUG, contact details, CI_PUBLISH_DOCS
  2. Fill docs/masters/PERSONAL_details.md - who you are; the agent reads this first
  3. Fill docs/masters/TAILORING_rules.md  - your roles and what to cut when a resume runs long
  4. Build ats.md and visual.md from those, then linkedin.md and STAR_questions.md
  5. Add RESUME_PAT in GitHub Settings > Secrets if you want the release workflows
  6. Commit. Everything under .github/ is generic and needs no edits.
NEXT
