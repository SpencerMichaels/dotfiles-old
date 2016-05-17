#!/bin/bash
# Runs all the other setup scripts in this folder.

# Ensure paths are setup first
set -e

#echo "1. Linking dotfiles."
#$SETUP_SCRIPTS_DIR/link.sh
# TODO: Use stow instead
exit 1

echo "2. Setting up Homebrew."
/bin/bash brew.sh

echo "3. Changing shell to zsh (needs root password)."
if [ -f /usr/local/bin/zsh ]; then
    sudo chsh -s /usr/local/bin/zsh `whoami`
else
    echo "/usr/local/bin/zsh not found!"
    exit 1
fi

echo "4. Modifying keymap."
/bin/bash keymap.sh

echo "5. Adding input sources"
/bin/bash inputsources.sh

echo "6. Setting sane defaults for OSX."
/bin/bash defaults.sh

echo "7. Setting sane defaults for apps"
/bin/bash apps.sh

exit 0
