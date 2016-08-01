#!/bin/bash
# Runs all the other setup scripts in this folder.

set -e

echo "Enter your password."
# From https://gist.github.com/brandonb927/3195465
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Enter your desired hostname:"
# From https://gist.github.com/brandonb927/3195465
read COMPUTER_NAME
sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME

echo "Please complete the XCode command line tools installation..."
xcode-select --install
echo "...and agree to the license:"
sudo xcodebuild -license

echo "1. Setting up Homebrew."
/bin/bash brew.sh

echo "2. Linking dotfiles."
/bin/bash link.sh

echo "3. Setting up zsh."
/bin/bash zsh.sh

echo "4. Modifying keymap."
/bin/bash keymap.sh

echo "5. Adding input sources"
/bin/bash inputsources.sh

echo "6. Setting sane defaults for OSX."
/bin/bash defaults.sh

echo "7. Setting sane defaults for apps"
/bin/bash apps.sh

echo "8. Creating iTerm visor app."
/bin/bash visor.sh

echo "9. Setting up NeoVim."
/bin/bash vim.sh

echo "Done!"

exit 0
