#!/bin/bash

echo "### LINKING DOTFILES ###"

if [ -z "$DOTFILES_ROOT_DIR" ]; then
	echo "Error: \$DOTFILES_ROOT_DIR is not set."
	exit 1
fi

cd $DOTFILES_ROOT_DIR

stow git
stow mpd
stow ncmpcpp
stow osx
stow scripts
stow tex
stow zsh

echo
