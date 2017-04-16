SHELL := /bin/bash

stow-emacs:
	@stow -v -t "$$HOME" emacs
