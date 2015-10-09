#!/bin/bash
# Runs all the other setup scripts in this folder.
set -e


# Check that the required paths are set up first.
if [ -z "$DOTFILES_ROOT_DIR" ] && \
   [ -z "$SETUP_SCRIPTS_DIR" ] && \
   [ -z "$DOTFILES_OSX_DIR" ]
then
    echo "Paths not set up. Run this script via setup.sh in the root dotfiles"
    echo "folder or source paths.sh manually."
    exit 1
fi


echo "1. Linking dotfiles."
$SETUP_SCRIPTS_DIR/link.sh

echo "2. Setting up Homebrew."
/bin/bash $SETUP_SCRIPTS_DIR/brew.sh

echo "3. Changing shell to zsh (needs root password)."
if [ -f /usr/local/bin/zsh ]; then
    sudo chsh -s /usr/local/bin/zsh `whoami`
else
    echo "/usr/local/bin/zsh not found!"
    exit 1
fi

echo "4. Modifying keymap."
/bin/bash $SETUP_SCRIPTS_DIR/keymap.sh

echo "5. Adding input sources"
/bin/bash $SETUP_SCRIPTS_DIR/inputsources.sh

echo "6. Setting sane defaults for OSX."
/bin/bash $SETUP_SCRIPTS_DIR/defaults.sh

echo "7. Setting sane defaults for apps"
/bin/bash $SETUP_SCRIPTS_DIR/apps.sh

exit 0
