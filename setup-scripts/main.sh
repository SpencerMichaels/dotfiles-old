#!/bin/bash
# Runs all the other setup scripts in this folder. 
set -e

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

exit 0
