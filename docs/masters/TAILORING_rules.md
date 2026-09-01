---
pdf_options:
  margin:
    top: 15mm
    bottom: 15mm
    left: 20mm
    right: 20mm
---

# Tailoring Rules

Person-specific rules for turning the master resumes into a one-page tailored resume. These name actual employers, projects, and sections from `ats.md` and `visual.md`, so they only make sense alongside this repo's own career history.

**If you forked this repo:** replace this entire file with your own inventory and ladder. `.github/copilot-instructions.md` stays as-is; it holds the generic formatting and workflow rules and defers to this file for anything person-specific. A skeleton is at the bottom.

---

## Experience Inventory

The sections that exist in the masters, in the order they appear, with how much room each earns in a tailored resume.

| Section in masters | Typical treatment when tailoring |
|---|---|
| Current role (Oracle, Principal Site Reliability Developer) | Keep. Currently one bullet. |
| Lead Software Engineer (Optum, May 2026 - Jul 2026) | Keep when the WarpStream story is relevant, or fold into the Senior entry when space is tight. |
| Senior Software Engineer (Optum, Sep 2022 - May 2026) | The main block. Reduce from 12+ master bullets to 5-7. |
| Featured Project: WarpStream Cluster Provisioning | Fold into a single compound bullet under whichever Optum entry carries it. |
| Organizational Initiative Leadership | Drop as a standalone section; fold key initiatives into a regular bullet if relevant. |
| Software Engineer (Optum, Jun 2020 - Aug 2022) | Compress to 1-2 bullets by merging related content. |
| Software Development Intern (Optum) | Drop entirely. |
| Student Software Developer (Sogeti USA) | Drop entirely. |
| Projects (OSNI / IEEE) | Compress to 1 bullet, or drop and roll the IEEE link into the Education line. |
| Education | Compress to a single inline line. |
| Certifications | Fold into the Education line unless the posting calls out certifications. |

## Content Rules (person-specific)

Applied after the generic content rules in `.github/copilot-instructions.md`:

1. Reduce the Senior role from 12+ bullets to 5-7. Drop bold lead-in labels and inline bold metrics.
2. Fold the WarpStream featured section into a single compound bullet.
3. Drop Organizational Initiative Leadership as a standalone section; fold key initiatives into regular bullets if relevant.
4. Compress the SE role to 1-2 bullets by merging related content.
5. Drop the Intern and Sogeti roles entirely.
6. Compress Projects to 1 bullet or drop entirely, rolling IEEE into the Education line.
7. Compress Education to a single inline line.

## Compression Ladder

Applied in order when a tailored resume still exceeds one page. Regenerate and recheck the page count after each step.

1. If a cover letter is also being generated, drop the Summary section. If no cover letter, keep Summary and continue to step 2.
2. Drop the Intern and Sogeti roles.
3. Compress the SE role bullets.
4. Fold WarpStream into a single bullet.
5. Drop the Organizational Initiative Leadership section.
6. Drop the Projects section, moving IEEE to the Education line.
7. Fold the Lead entry into the Senior entry, if both were broken out.

If the page is still marginally over after all of the above and every remaining bullet is load-bearing for the target role, fall back to `pdf_options.scale` per the Scale section in the copilot instructions.

## Standing Notes

- The IEEE publication is linked in most resumes.
- The Lead title was held briefly (May 2026 - Jul 2026). Tailored resumes may present the Optum tenure as a single Senior Software Engineer entry (Sep 2022 - Jul 2026) when a simpler timeline reads better, or break Lead out separately when the WarpStream ownership story is worth the space.
- Files already under `docs/submitted/` are frozen records of what was actually sent. Do not retroactively update them with new facts, titles, or contact details.

---

## Skeleton for a Fork

Replace everything above with your own version of this shape:

```markdown
## Experience Inventory
| Section in masters | Typical treatment when tailoring |
|---|---|
| <current role> | Keep. |
| <main role> | The main block. Reduce from N bullets to 5-7. |
| <early role> | Compress to 1-2 bullets. |
| <internships, student work> | Drop entirely. |
| <projects> | Compress to 1 bullet or drop. |

## Content Rules (person-specific)
1. <how much room each role gets>

## Compression Ladder
1. <what to cut first when over one page>
2. <what to cut next>

## Standing Notes
- <anything an agent should always know when tailoring for you>
```
