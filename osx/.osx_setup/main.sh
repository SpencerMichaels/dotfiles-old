#!/bin/bash
# Runs all the other setup scripts in this folder.

set -e

echo "1. Setting up Homebrew."
/bin/bash brew.sh

echo "2. Linking dotfiles."
$SETUP_SCRIPTS_DIR/link.sh

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

echo "8. Setting up iTerm visor."
/bin/bash visor.sh

exit 0
