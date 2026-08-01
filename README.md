# rkopp-env

A portable toolkit for **macOS machine setup** and **resume automation**. Fork it, swap in your own Brewfile and resume docs, and you get reproducible dev environments plus a markdown-to-PDF resume pipeline with CI/CD.

---

[![Resume to PDF Release](https://github.com/CalebmKopp/ckopp-env/actions/workflows/docs-to-pdf.yml/badge.svg)](https://github.com/CalebmKopp/ckopp-env/actions/workflows/docs-to-pdf.yml)
[![Brewfile/VSCode Extension Bundle and Release](https://github.com/CalebmKopp/ckopp-env/actions/workflows/bundle-to-release.yml/badge.svg)](https://github.com/CalebmKopp/ckopp-env/actions/workflows/bundle-to-release.yml)
[![GitHub Actions Security Analysis with zizmor 🌈](https://github.com/CalebmKopp/ckopp-env/actions/workflows/zizmor.yml/badge.svg)](https://github.com/CalebmKopp/ckopp-env/actions/workflows/zizmor.yml)

---

## Table of Contents

- [rkopp-env](#rkopp-env)
  - [Table of Contents](#table-of-contents)
  - [Quick Start](#quick-start)
  - [Repository Structure](#repository-structure)
  - [Machine Setup (Brewfile)](#machine-setup-brewfile)
    - [Fresh Install (new machine)](#fresh-install-new-machine)
    - [Syncing Your Current Machine State](#syncing-your-current-machine-state)
  - [Resume Automation](#resume-automation)
    - [Resume Document Hierarchy](#resume-document-hierarchy)
    - [Generating PDFs Locally](#generating-pdfs-locally)
    - [Customizing PDF Output](#customizing-pdf-output)
  - [Makefile Targets](#makefile-targets)
  - [CI/CD Workflows](#cicd-workflows)
  - [Windows Support](#windows-support)
    - [Setup](#setup)
    - [Usage](#usage)
    - [VSCode Extensions](#vscode-extensions)
  - [Forking This Repo for Your Own Use](#forking-this-repo-for-your-own-use)
    - [Tips for Colleagues](#tips-for-colleagues)
  - [TODO](#todo)

## Quick Start

```sh
# Clone the repo
git clone https://github.com/CalebmKopp/ckopp-env.git
cd ckopp-env

# Install everything (Homebrew, brew packages, VSCode extensions)
make fresh

# Generate resume PDFs locally
make docs
```

If `make` is not recognized, run `./hack/fresh_install.sh` directly (or install `make` via the options presented in your terminal).

## Repository Structure

```
ckopp-env/
├── .github/
│   ├── copilot-instructions.md  # Copilot context: formatting rules, workflows, conventions
│   └── workflows/               # CI/CD pipelines
│       ├── docs-to-pdf.yml      # Markdown resume -> PDF GitHub Release
│       ├── bundle-to-release.yml # Brewfile + VSCode list -> GitHub Release
│       └── zizmor.yml            # GitHub Actions security scanning
├── docs/                         # All resume content
│   ├── visual.md                 # Visual/rich resume (tables, formatting)
│   ├── masters/                  # Source-of-truth documents
│   │   ├── PERSONAL_details.md   # Personal identity, narratives, technical profile (Copilot context)
│   │   ├── STAR_questions.md     # STAR-format interview answers
│   │   ├── ats.md                # ATS-optimized master resume
│   │   └── linkedin.md           # LinkedIn profile content
│   ├── submitted/                # Company-specific submitted resumes & cover letters
│   ├── prospectives/             # Draft resumes for prospective applications
│   └── pdf/                      # Generated PDFs (gitignored, built locally or via CI)
├── hack/                         # Shell scripts backing the Makefile
│   ├── fresh_install.sh          # Full machine bootstrap (macOS)
│   ├── generate_install_lists.sh # Dump current brew/vscode state (macOS)
│   ├── generate_pdfs.sh          # Markdown -> PDF conversion (Bash)
│   ├── win_generate_pdfs.ps1     # Markdown -> PDF conversion (PowerShell/Windows)
│   ├── win_fresh_install.ps1     # VSCode extension install (Windows)
│   └── win_generate_install_lists.ps1  # Regenerate VSCode extension lists (Windows)
├── lists/                        # Declarative install manifests
│   ├── Brewfile                  # Homebrew bundle (taps, formulae, casks, vscode extensions)
│   ├── vsc_install_list.sh       # VSCode extension install script (Bash)
│   └── vsc_install_list.ps1      # VSCode extension install script (PowerShell/Windows)
├── Makefile                      # Automation entry point
└── README.md
```

## Machine Setup (Brewfile)

The `lists/Brewfile` is a [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) file that declaratively captures your entire dev environment: taps, formulae, casks, and VSCode extensions.

### Fresh Install (new machine)

```sh
make fresh
```

This runs `hack/fresh_install.sh`, which:
1. Installs Homebrew (if not already present)
2. Runs `brew bundle --file=./lists/Brewfile` to install all packages
3. Runs `lists/vsc_install_list.sh` to install all VSCode extensions

### Syncing Your Current Machine State

After installing new tools or extensions, capture your current state back into the repo:

```sh
make sync
```

This runs `hack/generate_install_lists.sh`, which:
1. Regenerates `lists/Brewfile` from your current `brew` state via `brew bundle dump`
2. Regenerates `lists/vsc_install_list.sh` from `code --list-extensions`
3. Runs `brew update && brew upgrade` to keep everything current

Commit and push the updated files to keep your setup tracked in git.

## Resume Automation

Resumes are written in Markdown with YAML frontmatter controlling PDF layout (margins, page size). PDFs are generated via [`md-to-pdf`](https://github.com/simonhaenisch/md-to-pdf).

### Resume Document Hierarchy

| Directory | Purpose |
|---|---|
| `docs/masters/` | Source-of-truth documents. `PERSONAL_details.md` holds your identity, narratives, and technical profile for Copilot context. `STAR_questions.md` holds STAR-format interview answers. `ats.md` is keyword-dense, plain-text friendly for applicant tracking systems. `linkedin.md` is structured for LinkedIn profile copy-paste. |
| `docs/visual.md` | Richly formatted resume with tables, HTML entities, and horizontal rules -- designed for human readers and PDF output. |
| `docs/submitted/` | Tailored resumes and cover letters for specific companies you've applied to. |
| `docs/prospectives/` | Draft resumes for companies you're considering applying to. |
| `docs/pdf/` | Generated PDF output. Gitignored -- build locally or download from GitHub Releases. |

### Generating PDFs Locally

```sh
# Generate PDFs for all docs/*.md files
make docs

# Generate a PDF for a specific file (by name, without extension)
make docs FILE=visual
```

Output lands in `docs/pdf/caleb-kopp-resume-{name}.pdf`.

**Prerequisite:** `npx` must be available (install Node.js via `nvm` or the Brewfile).

### Customizing PDF Output

Each markdown file can include YAML frontmatter to control PDF options:

```yaml
---
pdf_options:
  margin:
    top: 15mm
    bottom: 15mm
    left: 20mm
    right: 20mm
---
```

Only `pdf_options.margin` is used. Three margin tiers exist: Large (15mm/20mm, default), Medium (10mm/15mm), and Small (6mm/12mm). See the [md-to-pdf docs](https://github.com/simonhaenisch/md-to-pdf#readme) for all available options.

## Makefile Targets

| Target | Usage | Description |
|---|---|---|
| `help` | `make help` | Print all available targets with descriptions |
| `fresh` | `make fresh` | Bootstrap a new machine: install Homebrew, brew packages, and VSCode extensions |
| `sync` | `make sync` | Capture current machine state into `lists/`, update and upgrade all packages |
| `docs` | `make docs` | Convert all `docs/*.md` to PDF (macOS/Linux) |
| `docs` | `make docs FILE=visual` | Convert a single file to PDF (macOS/Linux) |
| `windocs` | `make windocs` | Convert all `docs/*.md` to PDF (Windows/PowerShell) |
| `windocs` | `make windocs FILE=visual` | Convert a single file to PDF (Windows/PowerShell) |
| `winfresh` | `make winfresh` | Install VSCode extensions on Windows |
| `winsync` | `make winsync` | Regenerate VSCode extension install lists on Windows |

## CI/CD Workflows

All workflows trigger on pushes to `main` and can also be run manually via `workflow_dispatch`.

| Workflow | Trigger | What It Does |
|---|---|---|
| `docs-to-pdf.yml` | Changes to `docs/*.md` | Converts top-level `docs/*.md` to PDF and creates a GitHub Release (tag: `YY.MM.DD.HHMM-pdf`) |
| `bundle-to-release.yml` | Changes to `lists/` | Creates a GitHub Release with the Brewfile and VSCode install script (tag: `YY.MM.DD.HHMM-bundle`) |
| `zizmor.yml` | Every push and PR | Runs GitHub Actions security analysis with [zizmor](https://github.com/woodruffw/zizmor) |

**Note:** The PDF workflow only processes `docs/*.md` at the top level (currently just `visual.md`). Subdirectory files (`masters/`, `submitted/`, `prospectives/`) are only built locally via `make docs`.

Both release workflows require a `RESUME_PAT` repository secret with permission to create releases.

## Windows Support

The machine bootstrap scripts (`make fresh`, `make sync`) are macOS-only (Homebrew, zsh). However, the resume PDF pipeline works on Windows via `make windocs`.

### Setup

```powershell
winget upgrade -r
winget install -e --id CoreyButler.NVMforWindows
winget install -e --id GnuWin32.Make
```

After installation, open a new terminal and install Node.js via nvm:

```powershell
nvm install lts
nvm use lts
```

### Usage

```powershell
# Generate PDFs for all docs/*.md files
make windocs

# Generate a PDF for a specific file
make windocs FILE=prospectives/<company>
```

The `windocs` target calls `hack/win_generate_pdfs.ps1`, which verifies that `nvm` and `npx` are available before running. If a prerequisite is missing, it prints the install command needed.

### VSCode Extensions

```powershell
# Install all tracked VSCode extensions
make winfresh

# Regenerate extension lists from current machine state
make winsync
```

`winfresh` installs all VSCode extensions from `lists/vsc_install_list.ps1`. `winsync` regenerates both the `.sh` and `.ps1` extension lists from your currently installed extensions.

**Note:** Chocolatey/winget package list automation is not yet implemented. System packages (Node.js, Make, etc.) must be installed manually via the setup steps above. Only VSCode extension management is automated on Windows at this time.

## Forking This Repo for Your Own Use

### Resume Generation
1. **Fill in your personal context** -- this is how Copilot learns who you are:
   - **`docs/masters/PERSONAL_details.md`** -- Replace with your own identity, experience narratives, technical profile, certifications, and career context. Brain-dump everything: who you are, what you work on, key projects, quantified achievements, technical skills, leadership style. The more detail you provide, the better Copilot can tailor resumes and cover letters for you.
   - **`docs/masters/STAR_questions.md`** -- Write your own STAR-format interview answers. Use the existing structure (Situation/Task/Action/Result) as a template and fill in your career stories.
2. **Build your master resume** -- Generate and iterate on `docs/masters/ats.md` using your PERSONAL_details.md as source material. This becomes a large (but not overfitted) context block that Copilot draws from when generating tailored resumes. Expand it as you think of more experience, projects, and skills.
3. **Build out your Linkedin Profile** -- Use `docs/masters/linkedin.md` as a structured reference for updating your LinkedIn profile; job descriptions can only be 2000 characters or so, and your headline ideally works best if it's short enough that people can scroll down and read the whole thing without expanding the box.
4. **Rename the PDF output** -- The script `hack/generate_pdfs.sh` hardcodes the output filename as `caleb-kopp-resume-{name}.pdf`. Change `caleb-kopp` to your own name in that script so your PDFs are named correctly.
5. **Set up the `RESUME_PAT` secret** -- in your fork's GitHub Settings > Secrets if you want the CI/CD release workflows to work
6. **Give an LLM access** -- This can either be, running on your local machine where you cloned the repo, or, via something like `https://claude.ai/code` web UI where you just give it the `RESUME_PAT` and it can read repo contents/make PRs for you
7. **Give JD's via prompt** -- However you interact with the LLM, the steps are as follows
  - Get a JD via a msg/email/listing
  - Paste that full JD into your LLM prompt
  - tell it to "follow the instructions in the repo XYZ" and it should
  - Read the `.github/copilot-instructions.md`, Read your `PERSONAL_details.md`, read your `ats.md` master file, generate additions to your `to-learn.md`, generate a resume in `docs/prospectives`, and re-iterate and re-generate that PDF into `docs/pdf/*` until it's 1 page long only
  - All of these steps can be changed by tinkering with `copilot-instructions.md` if you want to save more tokens, or just one shot a resume then run the PDF gen/tweaking the size down yourself

### Tracking Brew & vscode installations
1. **Replace the Brewfile**
   - Edit `lists/Brewfile` directly with the contents of your `brew bundle dump`
   - Run `brew bundle dump --force` while in the `lists/` directory, to force overwrite the current package list with your own
   - Run `make sync` while sitting in the repo root directory to regenerate the Brewfile from your machine, which deletes the old one
2. **Update the badge URLs** in this README to point to your fork
3. Commit, push, and your the workflows should handle the rest

### Tips for Colleagues
- Run `make sync` periodically to keep your Brewfile current as you install new tools
- The copilot instructions (`.github/copilot-instructions.md`) contain formatting rules, workflows, and conventions that are reusable as-is. Your personal details live separately in `docs/masters/PERSONAL_details.md`.
- You can delete the `docs/submitted/` and `docs/prospectives/` directories and start fresh
- Keep your `ats.md` as the plain-text master and derive tailored versions from it
- As you generate resumes and do interviews, naturally the `docs/writings/to-learn.md` will grow in size, with gaps between your current resume information and whatever job description you've fed the bot. Keep this in might, and periodically manually check the `to-learn.md` file for things you do want to learn, or things you DO have experience with and want to bring back to `PERSONAL_details.md`

## TODO

- Add a pause in the script to run the `brew` shellenv setup commands:
  ```sh
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/<MY-USER>/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ```
- Add Windows-compatible package list automation (chocolatey, winget, or similar) for system packages in `make winfresh` and `make winsync`
- Sync up job-specific `.zshrc` and kubeconfigs (encrypted in repo, decrypted locally)
