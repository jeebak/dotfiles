SHELL := /bin/bash

STOWABLE = beets colordiff emacs git jshint less mpv screen ranger tmux
STOW_OPTIONS =

stow-all: STOW_OPTIONS =
stow-all: $(STOWABLE)

restow-all: STOW_OPTIONS = -R
restow-all: $(STOWABLE)

unstow-all: STOW_OPTIONS = -D
unstow-all: $(STOWABLE)

$(STOWABLE):
	@echo "$$(tput setaf 3)Processing: $$(tput setaf 5)$@$$(tput sgr0)"
	@[[ -x "$@/hooks/pre-invoke" ]] && { echo "$$(tput setaf 5)  Running $$(tput setaf 3)pre-invoke$$(tput setaf 5) hook$$(tput sgr0)"; "./$@/hooks/pre-invoke"; } || true
	@stow -v -t "$$HOME" \
		--no-folding \
		--ignore='^README.md$$' \
		--ignore='^hooks$$' \
 		$(STOW_OPTIONS) $@
	@[[ -x "$@/hooks/post-invoke" ]] && { echo "$$(tput setaf 5)  Running $$(tput setaf 3)post-invoke$$(tput setaf 5) hook$$(tput sgr0)"; "./$@/hooks/post-invoke"; } || true

.PHONY: $(STOWABLE)
