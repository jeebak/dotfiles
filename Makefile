SHELL := /bin/bash

ACTION = stow
STOWABLE = beets colordiff emacs fzf git jshint less mpv screen ranger tmux
STOW_OPTIONS =

stow-all: ACTION = stow
stow-all: STOW_OPTIONS =
stow-all: $(STOWABLE)

unstow-all: ACTION = unstow
unstow-all: STOW_OPTIONS = -D
unstow-all: $(STOWABLE)

# Stow has -R option, but use this, to trigger *-unstow and *-stow hooks
restow-all: unstow-all
	make stow-all

$(STOWABLE):
	@echo "$$(tput setaf 3)Processing: $$(tput setaf 5)$@$$(tput sgr0)"
	@[[ -x "$@/hooks/pre-$(ACTION)" ]] \
		&& { echo "$$(tput setaf 5)  Running $$(tput setaf 3)pre-$(ACTION)$$(tput setaf 5) hook$$(tput sgr0)"; "./$@/hooks/pre-$(ACTION)"; } \
		|| true
	@stow -v -t "$$HOME" \
		--no-folding \
		--ignore='^README.md$$' \
		--ignore='^hooks$$' \
 		$(STOW_OPTIONS) $@
	@[[ -x "$@/hooks/post-$(ACTION)" ]] \
		&& { echo "$$(tput setaf 5)  Running $$(tput setaf 3)post-$(ACTION)$$(tput setaf 5) hook$$(tput sgr0)"; "./$@/hooks/post-$(ACTION)"; } \
		|| true

.PHONY: $(STOWABLE)
