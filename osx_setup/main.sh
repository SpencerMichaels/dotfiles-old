#!/bin/bash
# Runs all the other setup scripts in this folder.

set -e

echo "### OS X SETUP ###"

# From https://gist.github.com/brandonb927/3195465
echo -n "Enter your password: "
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo

echo -n "Enter your desired hostname: "
read COMPUTER_NAME
echo

sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME

if ! command -v gcc > /dev/null 2>&1; then
	echo "- Install XCode developer tools."
	xcode-select --install
	echo "   - Agree to XCode license."
	sudo xcodebuild -license
else
	echo "- XCode already installed."
fi

echo "### BEGIN AUTOCONFIG ###"
echo

echo "1. Set up Homebrew."
/bin/bash brew.sh

echo "2. Set up zsh."
/bin/bash zsh.sh

echo "3. Link dotfiles."
/bin/bash link.sh

echo "4. Set sane OS X defaults."
/bin/bash defaults.sh

echo "5. Set app defaults."
/bin/bash apps.sh

echo "6. Set up Neovim."
/bin/bash nvim.sh

echo "### DONE ###"

exit 0
