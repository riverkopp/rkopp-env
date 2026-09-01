# Copilot Instructions

## Personal Context

Personal identity, experience narratives, technical profile, and career context live in dedicated files that Copilot should read when generating resumes, cover letters, or interview prep:

- **docs/masters/PERSONAL_details.md** - Who I am, what I work on, key narratives, technical identity, certifications, leadership style, and tailoring guidance.
- **docs/masters/STAR_questions.md** - STAR-format interview answers with detailed Situation/Task/Action/Result for key career stories.
- **docs/masters/ats.md** - ATS-optimized master resume (source of truth for all resume content).
- **docs/masters/TAILORING_rules.md** - Person-specific tailoring rules: which sections exist, how much room each earns, and the order to cut them in when a resume runs long. Everything in this file that names a real employer or project lives there, not here.
- **docs/masters/linkedin.md** - LinkedIn profile content.
- **docs/masters/visual.md** - Visual/rich master resume.

When generating tailored resumes or cover letters, read PERSONAL_details.md and ats.md as primary source material. When generating interview prep, also read STAR_questions.md.

---

## Resume and Cover Letter Rules

### Terminology
- "Add to the masters" means docs/masters/ats.md and docs/masters/visual.md. If the content is also relevant as initial context for future resume/cover letter generation (e.g., narratives, facts, identity details), also update docs/masters/PERSONAL_details.md.

### Working Rules
- Prefer make targets over calling scripts directly.
	- Use `make fresh`, `make sync`, `make docs`, and `make docs FILE=<path>` where `<path>` is relative to `docs/` (e.g., `make docs FILE=prospectives/nintendo`).
- Keep changes minimal and scoped to the requested task.
- Do not rewrite large resume sections unless requested.
- Preserve established wording and quantified claims unless asked to update them.

### Source of Truth
- Resume content: docs/ (top-level plus masters/, submitted/, prospectives/).
- PDF generation script: hack/generate_pdfs.sh.
- CI workflows: .github/workflows/*.yml.

### General Editing Rules
- Preserve YAML frontmatter and `pdf_options` blocks in Markdown files.
- Keep punctuation plain ASCII. Do not introduce em dashes or en dashes.
- Avoid fabrication:
	- Do not invent employers, dates, metrics, tools, certifications, or outcomes.
	- If a requested change needs missing facts, ask for them.
- Keep role-specific tailoring targeted to the company/job without changing core chronology.

### Margins (pdf_options)
Three margin tiers exist (small, medium, large). Always start with Small. Step up only when content fits comfortably with room to spare.

| Tier | top/bottom | left/right | When to use |
|---|---|---|---|
| Small | 6mm | 12mm | Default starting point for all resumes and cover letters |
| Medium | 10mm | 15mm | Step up when Small leaves significant whitespace |
| Large | 15mm | 20mm | Step up when Medium still leaves significant whitespace |

### Scale (pdf_options)
`pdf_options.margin` and `pdf_options.scale` are the two levers available. No other pdf_options are used.

`scale` shrinks or grows the whole rendered page, font size and spacing together. Omit it entirely when content already fits; the default is 1.0. Use it when a resume is close to fitting on one page and further trimming would cost real content.

| Value | Effect | When to use |
|---|---|---|
| 1.0 (omit) | Default rendering | Content already fits on one page |
| 0.95 | Slight reduction | A few lines over |
| 0.90 | Noticeable but still comfortably readable | Roughly a third of a page over, or an extra experience entry was added |
| Below 0.85 | Too small to read comfortably | Do not use; cut content instead |

Do not use CSS to control font size. md-to-pdf scopes its stylesheet to `.markdown-body`, so a `body { font-size: ... }` rule in a `css` frontmatter block silently does nothing. Set `pdf_options.scale` instead.

Prefer cutting content over scaling. Reach for `scale` only after the One-Page Compression Priority steps below have been applied and the page is still marginally over.

### Heading Hierarchy
Master resumes (visual.md, ats.md) use h1 for the name and h2 for section titles.
Submitted/prospective resumes shift the entire hierarchy down two levels:
- h3: Name - Current Title (always the actual current job title, never the target role title)
- h4: Section titles (Skills, Experience, Projects, Education)
- h5: Job title - Company

Cover letters use no heading levels at all - just bold name, plain text, and paragraphs.

### Contact Line
- **Master visual:** `&nbsp;&nbsp;|&nbsp;&nbsp;` (double nbsp each side of pipe)
- **Master ATS:** plain ` | ` (space-pipe-space, zero HTML entities)
- **Submitted/prospective resumes and cover letters:** `&nbsp;|&nbsp;` (single nbsp each side)

Master files use `# <YOURNAME>`. Submitted/prospective resumes use `### <YOURNAME> - <CURRENT_TITLE>` (always the actual current job title, never the target role title). Cover letters use `**<YOURNAME>**` (bold, no heading).

### Resume Section Order
Canonical order: **Name > Summary > Skills > Experience > Projects > Education**.
- Summary is included in masters but dropped in most tailored files. Keep it only when the role posting emphasizes a holistic profile.
- When Summary is dropped, Skills immediately follows the contact block + `---`.
- visual.md calls it "Core Skills" (table format). All others call it "Skills".

### Voice and Tense
- **Resume bullets:** Third-person implied (no "I" pronoun). Every bullet leads with a strong action verb.
	- Current role (Present): "Serve", "Own", "Maintain", "Extend", "Build", "Lead", "Captain", "Drive".
	- Past roles: "Contributed", "Implemented", "Assumed", "Designed", "Partnered", "Led".
	- Completed projects under the current role use past tense: "Co-led", "Delivered", "Shipped".
- **Cover letters:** First person throughout ("I serve...", "I am writing..."). Confident and direct but not arrogant. State credentials as facts with metrics, not self-praise.

### Skills Section Format
Format varies by document type:

- **visual.md:** Markdown table with `**Category & Subcategory**` headers using `&`.
- **ats.md:** Bold header paragraph style: `**Category and Subcategory:** skill, skill, ...` using "and".
- **Submitted/prospective:** Dash-led list: `- **Short Category:** skill, skill, ...` with abbreviated category labels.

When tailoring, skills categories are renamed, reordered, and pruned to mirror the job posting. The first 2-3 categories should be the most relevant to the target role. Skills within each category are reordered to front-load the most relevant terms.

### Experience Entry Format
- **Master visual:** `### Title at Company (Parent)` then bold subtitle with `&middot;`, 4x`&nbsp;` gap, italic dates.
- **Master ATS:** `### Title` then `Company, Parent | Location | Dates` (plain pipes), then bold subtitle.
- **Submitted/prospective:** `##### Title - Company, Parent` then `*Dates* &nbsp;|&nbsp; Location` on the next line.

### Bold and Italic Rules
- **Bold lead-in labels** (e.g., `**KRM SME:**`) and **inline bold metrics** (e.g., `**80%**`) appear only in master resumes. Submitted/prospective resume bullets use plain text with no bold.
- **Italic** is used only for date ranges in submitted/prospective files. Never used for emphasis.
- `&middot;` is exclusive to visual.md. Do not use it in any other file.

### Horizontal Rules
`---` appears after the contact block in every file and between major sections in masters. Submitted files use 3-4 rules; masters use more. Cover letters use one `---` after the header block (company/role line).

### Link Format
- Inline links only: `[text](url)`. Never reference-style.
- Publications, if any, are linked per docs/masters/TAILORING_rules.md.
- LinkedIn is a markdown link only in ats.md. All other files use plain text.
- Cover letters contain zero links.

### Cover Letter Structure

#### Header Block
```
**<YOURNAME>**
[Location] &nbsp;|&nbsp; [contact info]

[Month DD, YYYY]

[Company Name]
[Role Title]

---
```

#### Greeting
- Personal name when known: `To [Name] at [Company],`
- Generic when not: `To the [Company] hiring team,`

#### Paragraph Structure (5-6 paragraphs)
1. **Mission hook:** Open with the company's mission/values, state personal connection, declare interest.
2. **Platform credibility:** Stats-heavy paragraph establishing technical depth (1,000+ nodes, five nines, zero data loss).
3. **Featured differentiator:** Deep-dive into the most relevant experience for this specific role.
4. **Secondary strength:** Additional relevant skill area.
5. **Team leadership + culture:** Leadership, mentoring, and values alignment.
6. **Culture fit** (sometimes merged with para 5): Direct reference to company values.

#### Sign-off
Always the same two lines, no variation:
```
Thank you for your time and consideration.

<YOURNAME>
```

### Gap Analysis
When a job description is provided, the first step before generating any tailored documents is to assess fit and identify honest skill gaps. Present this assessment to the user before proceeding with resume/cover letter generation.

#### Fit Assessment
Briefly outline:
- **Strong matches:** Areas where actual experience maps directly to JD requirements.
- **Honest gaps:** Areas where the JD requires depth the user does not yet have.
- **Overall take:** Whether this looks like a strong, reasonable, or stretch fit, and why.

#### Gap Identification
Append new gaps to docs/writings/to-learn.md under a heading named for the role (e.g., `## Gaps - Company Role Title`). Gaps should be specific and actionable, not generic. Categories to evaluate:
- Technologies or products called out in the JD that have not been used in production (or have only been touched at the infrastructure/Terraform level without deep API or internals knowledge).
- Theoretical CS or distributed systems concepts the JD implies (consistency models, consensus protocols, DS&A interview prep) where knowledge is operational/intuitive rather than formal.
- Languages listed on the resume but not used as a primary daily language.
- Database/storage depth beyond what has been used in production.
- Any other area where honest self-assessment reveals a gap worth studying.

Do not fabricate gaps. Only flag areas where the user's own description of their experience (in PERSONAL_details.md and STAR_questions.md) indicates the gap is real. If the user provides additional context about what they do and do not know about a topic, incorporate that nuance.

### Resume Tailoring Workflow

#### End-to-End Flow
1. User provides the full text of a job description.
2. Read docs/masters/ats.md, docs/masters/PERSONAL_details.md, and docs/masters/linkedin.md as source material.
3. Perform the Gap Analysis (see above): assess fit, identify gaps, present to the user, and append gaps to docs/writings/to-learn.md.
4. Generate a tailored resume markdown file applying the content rules below.
5. Write the file to docs/prospectives/ (or docs/submitted/ if applying).
6. Run `make docs FILE=<path>` to produce the PDF, where `<path>` is relative to `docs/` (e.g., `make docs FILE=prospectives/*newresume*`).
7. Check the PDF page count. If it exceeds one page, apply the One-Page Compression Priority in order, regenerate, and recheck until it fits.

#### Content Rules
When generating the tailored resume from masters:
1. Shift heading hierarchy down two levels (h1->h3, h2->h4, h3->h5).
2. Embed current title in name heading: `### <YOURNAME> - <CURRENT_TITLE>`. Always use the actual current job title (e.g., "Senior Software Engineer"), never the target role title. The resume bullets and cover letter demonstrate readiness for the target level.
3. Drop Summary unless the JD emphasizes a holistic profile.
4. Rename, reorder, and prune Skills categories to mirror the job posting. Front-load the most relevant terms within each category.
5. Reword bullets for culture fit - echo the JD's language and priorities while preserving factual accuracy.
6. Highlight experience that directly maps to JD requirements; de-emphasize or drop bullets with no JD relevance.
7. Drop bold lead-in labels and inline bold metrics from every bullet.
8. Apply the person-specific content rules in docs/masters/TAILORING_rules.md, which say how many bullets each role earns, which sections fold together, and which roles drop entirely.
9. Compress Education to a single inline line.

#### One-Page Compression Priority
Always start at Small margins (6mm/12mm). Regenerate and recheck the page count after each step.
1. Work down the Compression Ladder in docs/masters/TAILORING_rules.md, which lists what to cut, in what order, for this person's specific history.
2. As a last resort, set `pdf_options.scale` (see Scale above). Reach for it only when the ladder is exhausted and the remaining content is all load-bearing for the target role, such as when an extra experience entry has been broken out and every bullet still earns its place.

### PDF Generation and Naming
- Local PDF output path is docs/pdf/.
- File naming is `<PDF_SLUG>-resume-<name>.pdf`, where `PDF_SLUG` comes from `profile.env` at the repo root. Do not hardcode a name in the scripts or the workflow.
- CI converts only the documents listed in `CI_PUBLISH_DOCS` in `profile.env`.
	- Everything else under docs/ is a local build only.

### PDF Delivery
When generating resumes or cover letters in a Claude Code chat session, always send the generated PDF to the user in the chat after generation using the SendUserFile tool.

### Known Resume Constraints
- All resumes for roles should fit on one page. If content exceeds one page, apply the compression tactics in the specified order. The Masters can exceed one page, but all submitted/prospective resumes should be one page.
- When page count matters, prefer reliable local verification methods over Spotlight metadata.
- Page count verification: after generating a PDF, run `strings <pdf> | grep '/Type /Page'` and count only lines that are exactly `/Type /Page` (not `/Type /Pages`). The `/Type /Pages` entry is the page tree root and does not represent a page. Do not use `grep -c` as it will overcount by 1. Inspect the raw output lines instead.

### Validation Checklist
1. If docs changed, run the relevant docs build command.
2. If workflows changed, verify YAML syntax and trigger scope.
3. Confirm no accidental renames or output path changes.

---

## Environment and Machine Setup

### Source of Truth
- Environment setup and project usage: README.md and Makefile.
- Machine bootstrap scripts: hack/fresh_install.sh and hack/generate_install_lists.sh.
- Package manifests: lists/Brewfile and lists/vsc_install_list.sh.

### Environment Manifest Rules
- Treat lists/Brewfile and lists/vsc_install_list.sh as generated artifacts.
- When updating machine state manifests, prefer `make sync` to regenerate them.
- If editing lists manually is requested, preserve current format and ordering style as much as possible.

### Workflow Safety Rules
- Keep release tag formats unchanged unless explicitly requested:
	- `YY.MM.DD.HHMM-pdf`
	- `YY.MM.DD.HHMM-bundle`
- Keep use of `RESUME_PAT` and release upload behavior intact unless asked to change CI auth/release strategy.
- Do not broaden workflow trigger paths unless requested.

### Shell Script Conventions
- Use Bash-compatible syntax.
- Preserve script portability assumptions already in repo.
- Keep shebang style consistent with each file.

### Validation Checklist
1. If lists changed, ensure generated scripts/manifests are syntactically valid.
2. If workflows changed, verify YAML syntax and trigger scope.
3. Confirm no accidental renames or output path changes.

