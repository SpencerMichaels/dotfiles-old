#!/bin/bash

echo "### LINKING DOTFILES ###"

source paths.sh

if [ -z "$DOTFILES_ROOT_DIR" ]; then
	echo "Error: \$DOTFILES_ROOT_DIR is not set."
	exit 1
fi

cd $DOTFILES_ROOT_DIR

stow git
stow mpd
stow ncmpcpp
stow nvim
stow osx
stow scripts
stow tex
stow tmux
stow zsh

echo
