#!/bin/bash

echo "### LINKING DOTFILES ###"

cd $DOTFILES_ROOT_DIR

stow git
stow mpd
stow ncmpcpp
stow osx
stow scripts
stow tex
stow zsh

echo
