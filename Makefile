SHELL := /bin/bash

# TODO: make these generic

stow-beets:
	@stow -v -t "$$HOME" beets

stow-colordiff:
	@stow -v -t "$$HOME" colordiff

stow-emacs:
	@stow -v -t "$$HOME" emacs

stow-git:
	@stow -v -t "$$HOME" git

stow-jshint:
	@stow -v -t "$$HOME" jshint

stow-less:
	@stow -v -t "$$HOME" less

stow-ranger:
	@stow -v -t "$$HOME" ranger

stow-tmux:
	@stow -v -t "$$HOME" tmux
