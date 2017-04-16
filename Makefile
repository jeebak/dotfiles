SHELL := /bin/bash

# TODO: make these generic

stow-emacs:
	@stow -v -t "$$HOME" emacs

stow-git:
	@stow -v -t "$$HOME" git

stow-jshint:
	@stow -v -t "$$HOME" jshint

stow-less:
	@stow -v -t "$$HOME" less
