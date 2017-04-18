SHELL := /bin/bash

ACTION = stow
STOWABLE = beets colordiff emacs fzf git jshint less mpv screen ranger tmux
STOW_OPTIONS =

stow-all: ACTION = stow
stow-all: STOW_OPTIONS =
stow-all: $(STOWABLE)

restow-all: ACTION = restow
restow-all: STOW_OPTIONS = -R
restow-all: $(STOWABLE)

unstow-all: ACTION = unstow
unstow-all: STOW_OPTIONS = -D
unstow-all: $(STOWABLE)

$(STOWABLE):
	@echo "$$(tput setaf 3)Processing: $$(tput setaf 5)$@$$(tput sgr0)"
	@[[ -x "$@/hooks/pre-$(ACTION)" ]] \
		&& { echo "$$(tput setaf 5)  Running $$(tput setaf 3)pre-invoke$$(tput setaf 5) hook$$(tput sgr0)"; "./$@/hooks/pre-$(ACTION)"; } \
		|| true
	@stow -v -t "$$HOME" \
		--no-folding \
		--ignore='^README.md$$' \
		--ignore='^hooks$$' \
 		$(STOW_OPTIONS) $@
	@[[ -x "$@/hooks/post-$(ACTION)" ]] \
		&& { echo "$$(tput setaf 5)  Running $$(tput setaf 3)post-invoke$$(tput setaf 5) hook$$(tput sgr0)"; "./$@/hooks/post-$(ACTION)"; } \
		|| true

.PHONY: $(STOWABLE)
