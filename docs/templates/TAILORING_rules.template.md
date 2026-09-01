---
pdf_options:
  margin:
    top: 15mm
    bottom: 15mm
    left: 20mm
    right: 20mm
---

# Tailoring Rules

Person-specific rules for turning the master resumes into a one-page tailored
resume. `.github/copilot-instructions.md` holds the generic formatting and
workflow rules and defers to this file for anything that names a real employer,
project, or resume section.

This is the one file where your career's shape has to be described. Fill it in
after `PERSONAL_details.md` and `ats.md` exist, since it refers to sections in them.

---

## Experience Inventory

Every section in the masters, in order, and how much room each earns when tailoring.

| Section in masters | Typical treatment when tailoring |
|---|---|
| <Current role> | Keep. |
| <Main role> | The main block. Reduce from <N> master bullets to 5-7. |
| <Featured project> | Fold into a single compound bullet. |
| <Standalone initiative section> | Drop as a section; fold into a regular bullet if relevant. |
| <Earlier role> | Compress to 1-2 bullets by merging related content. |
| <Internship / student work> | Drop entirely. |
| <Projects> | Compress to 1 bullet, or drop and roll any publication link into Education. |
| Education | Compress to a single inline line. |
| Certifications | Fold into the Education line unless the posting calls out certifications. |

## Content Rules (person-specific)

Applied after the generic content rules in `.github/copilot-instructions.md`:

1. <How many bullets the main role earns, and what formatting to drop.>
2. <Which sections fold together.>
3. <Which roles drop entirely.>
4. <How far to compress the earliest roles.>

## Compression Ladder

Applied in order when a tailored resume still exceeds one page. Regenerate and
recheck the page count after each step. Order these cheapest-to-lose first.

1. If a cover letter is also being generated, drop the Summary section.
2. <Next thing to cut.>
3. <Next thing to cut.>

If the page is still marginally over after the whole ladder and every remaining
bullet is load-bearing, fall back to `pdf_options.scale` per the Scale section in
the copilot instructions.

## Standing Notes

- <Anything an agent should always know when tailoring for you: which links always
  appear, how to handle a short-tenure title, which numbers are current.>
- Files already under `docs/submitted/` are frozen records of what was actually
  sent. Do not retroactively update them with new facts, titles, or contact details.
