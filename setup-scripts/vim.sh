#!/bin/bash

echo "- Cloning Vundle."
git clone https://github.com/VundleVim/Vundle.vim.git \
    $DOTFILES_ROOT_DIR/vim/vim.symlink/bundle/Vundle.vim

echo "- Installing Vundle plugins."
vim +PluginInstall +qall

# duti?

exit 0
