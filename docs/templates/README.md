# Templates

Skeletons for the four files under `docs/masters/`, plus a starter `profile.env`.

If you forked this repo, run `make init` from the repo root. It copies these over
`docs/masters/`, resets `profile.env`, clears the previous owner's submitted
resumes and drafts, and repoints the README badges at your fork. It prompts before
deleting anything; `make init FORCE=1` skips the prompt.

To do it by hand instead:

```sh
cp docs/templates/profile.env.example profile.env
for f in PERSONAL_details ats linkedin STAR_questions TAILORING_rules; do
  cp "docs/templates/$f.template.md" "docs/masters/$f.md"
done
rm -rf docs/submitted/* docs/prospectives/* docs/writings/* etc/*
```

Then fill in `profile.env` and `docs/masters/PERSONAL_details.md` first. Everything
else is generated from those two by an agent following `.github/copilot-instructions.md`.
