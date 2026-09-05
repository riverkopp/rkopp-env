.PHONY: help fresh sync init docs pushsync winfresh winsync windocs

help:  ## Print this help.
#> The machine-facing targets (fresh, sync) only touch Homebrew, VSCode
#> extensions and the lists in lists/, and are safe to run again at any time.
#> init is the exception: it deletes things. Read its entry before running it.
	@awk 'BEGIN { FS = ":.*?## " } \
	     /^[a-zA-Z_-]+:.*?## / { printf "\n\033[36m\033[1m%s\033[0m\n    %s\n", $$1, $$2 ; next } \
	     /^#> / { printf "    %s\n", substr($$0, 4) }' $(MAKEFILE_LIST)
	@echo ""

fresh:  ## Set this machine up from the tracked lists. Start here on a new machine.
#> 1. Installs Homebrew if it is missing and puts it on this shell's PATH.
#> 2. Asks once whether this is a personal or a professional machine and
#>    remembers the answer in etc/profile.txt, which is gitignored.
#> 3. Installs lists/Brewfile plus the matching lists/Brewfile.<profile>,
#>    including the VSCode extensions tracked as `vscode "..."` entries.
#>    Retries the bundle BUNDLE_ATTEMPTS times (default 3), last pass serial,
#>    because several third-party CDNs reset connections under parallel loads.
#> 4. Symlinks docker to podman, unless something already owns that name.
#> 5. Prints every entry still missing with the reason and the exact fix, then
#>    reprints all the Homebrew caveats that scrolled past during the install.
	./hack/fresh_install.sh

sync:  ## Capture what is installed here back into the tracked lists. Run after installing anything.
#> 1. Runs `brew update && brew upgrade`, so this upgrades packages too.
#> 2. Regenerates lists/Brewfile from `brew bundle dump`.
#> 3. Asks where each newly installed package belongs: every machine, personal
#>    only, or work only. The one-sided ones go to lists/Brewfile.<profile>.
#> 4. Carries forward entries tracked but not installed here, so a failed
#>    install cannot quietly drop a package from the list.
#> 5. Drops what you uninstalled since the last sync, and anything Homebrew has
#>    disabled, which no fresh machine could install again anyway.
#> 6. Regenerates lists/vsc_install_list.{sh,ps1} from `code --list-extensions`.
#> Commit the result. Nothing is tracked until you do.
	./hack/generate_install_lists.sh

init:  ## Bootstrap a fork of this repo for yourself. DESTRUCTIVE, run it once (usage: make init [FORCE=1])
#> Replaces the previous owner's career content with the templates in
#> docs/templates/ and points the README at your fork. It deletes every
#> submitted resume, prospective draft, writing and generated PDF in the
#> working tree, so run it right after cloning your fork and never again.
#> It prompts before deleting; FORCE=1 skips the prompt for scripted setup.
	./hack/init.sh

docs:  ## Build PDFs from docs/*.md into docs/pdf/ (usage: make docs [FILE=name])
#> Uses md-to-pdf, with page size and margins read from each file's YAML
#> frontmatter. FILE=name builds only docs/name.md.
	./hack/generate_pdfs.sh $(FILE)

pushsync:  ## Add, commit and push everything in one go (usage: make pushsync MSG="what changed")
#> The commit message is always prefixed with "make sync: ", so this is meant
#> for list updates rather than code changes. Commits every modified file.
	git add . && git commit -m 'make sync: $(MSG)' && git push

winfresh:  ## Windows: install the tracked VSCode extensions.
#> Runs the PowerShell half of `make fresh`. Windows has no Homebrew, so this
#> covers extensions only; install the applications yourself.
	pwsh -File ./hack/win_fresh_install.ps1

winsync:  ## Windows: regenerate the VSCode extension install lists.
#> The PowerShell counterpart to `make sync`, for the extension lists only.
	pwsh -File ./hack/win_generate_install_lists.ps1

windocs:  ## Windows: build PDFs from docs/*.md (usage: make windocs [FILE=name])
#> Same output as `make docs`, driven by PowerShell instead.
	pwsh -File ./hack/win_generate_pdfs.ps1 $(FILE)
