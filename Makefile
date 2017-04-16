SHELL := /bin/bash

# TODO: make these generic

stow-emacs:
	@stow -v -t "$$HOME" emacs

stow-git:
	@stow -v -t "$$HOME" git
