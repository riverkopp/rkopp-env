.PHONY: sync help fresh docs windocs winfresh winsync

help:  ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

sync:  ## update Brewfile and ./vsc_install_list.sh
	./hack/generate_install_lists.sh

fresh:  ## do fresh install of brew, vsc, and all related extensions/applications
	./hack/fresh_install.sh

docs:  ## convert docs/*.md to PDF in docs/pdf/ (usage: make docs [FILE=name])
	./hack/generate_pdfs.sh $(FILE)

windocs:  ## convert docs/*.md to PDF on Windows via PowerShell (usage: make windocs [FILE=name])
	pwsh -File ./hack/win_generate_pdfs.ps1 $(FILE)

winfresh:  ## install VSCode extensions on Windows (usage: make winfresh)
	pwsh -File ./hack/win_fresh_install.ps1

winsync:  ## regenerate VSCode extension install lists on Windows (usage: make winsync)
	pwsh -File ./hack/win_generate_install_lists.ps1
pushsync:  ## runs git commands to add, commit, and push changes up with optional commit message (usage make pushsync MSG="my message")
	git add . && git commit -m 'make sync: $(MSG)' && git push
