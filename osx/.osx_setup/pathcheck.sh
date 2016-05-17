#!/bin/bash

# Check that the required paths are set up.
if [ -z "$DOTFILES_ROOT_DIR" ] && \
   [ -z "$SETUP_SCRIPTS_DIR" ] && \
   [ -z "$DOTFILES_OSX_DIR" ]
then
    echo "Paths not set up. Run this script via setup.sh in the root dotfiles"
    echo "folder or source paths.sh manually."
    exit 1
fi

