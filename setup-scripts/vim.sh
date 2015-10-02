#!/bin/bash
# Installs Vim addons through Vundle. TODO: File associations.

echo "- Cloning Vundle."
git clone https://github.com/VundleVim/Vundle.vim.git \
    $DOTFILES_ROOT_DIR/vim/vim.symlink/bundle/Vundle.vim

echo "- Installing Vundle plugins."
vim +PluginInstall +qall

# duti?
duti file_associations.duti

exit 0
