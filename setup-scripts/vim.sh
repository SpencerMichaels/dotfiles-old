#!/bin/bash
# Installs Vim addons through Vundle. TODO: File associations.


# Check that the required paths are set up first.
if [ -z "$DOTFILES_ROOT_DIR" ] && \
   [ -z "$SETUP_SCRIPTS_DIR" ] && \
   [ -z "$DOTFILES_OSX_DIR" ]
then
    echo "Paths not set up. Run this script via setup.sh in the root dotfiles"
    echo "folder or source paths.sh manually."
    exit 1
fi


echo "- Cloning Vundle."
git clone https://github.com/VundleVim/Vundle.vim.git \
    $DOTFILES_ROOT_DIR/vim/vim.symlink/bundle/Vundle.vim

echo "- Installing Vundle plugins."
vim +PluginInstall +qall

# duti?
duti file_associations.duti

exit 0
