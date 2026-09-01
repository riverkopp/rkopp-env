#!/usr/bin/env bash

# Identity lives in profile.env at the repo root
# shellcheck source=/dev/null
. "$(dirname "$0")/../profile.env"
: "${PDF_SLUG:?PDF_SLUG not set in profile.env}"

mkdir -p docs/pdf

if [[ -n "$1" ]]; then
  f="docs/${1}.md"
  if [[ ! -f "$f" ]]; then
    echo "Error: $f not found. Available:"
    ls docs/*.md 2>/dev/null | sed 's|docs/||;s|\.md||'
    exit 1
  fi
  files=("$f")
else
  files=(docs/*.md)
fi

for f in "${files[@]}"; do
  base=$(basename "$f" .md)
  echo "Converting $f → docs/pdf/${PDF_SLUG}-resume-${base}.pdf"
  npx --yes md-to-pdf "$f"
  mv "${f%.md}.pdf" "docs/pdf/${PDF_SLUG}-resume-${base}.pdf"
done

echo "Done:"
ls -lah docs/pdf/*.pdf
