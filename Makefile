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
	@stow -v -t "$$HOME" \
		--no-folding \
		--ignore='^README.md$$' \
 		$(STOW_OPTIONS) $@

.PHONY: $(STOWABLE)
