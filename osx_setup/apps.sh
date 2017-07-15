#!/bin/bash
# Configures defaults for applications. Assumes, of course, that they are
# installed.
set -e

echo "### CONFIGURE APPS ###"

if [ -z "$DOTFILES_ROOT_DIR" ]; then
	echo "Error: \$DOTFILES_ROOT_DIR is not set."
	exit 1
fi

echo "- Set default filetype associations"
duti resources/file_associations.duti

echo "- Set Iterm2 configuration directory"
defaults write com.googlecode.iterm2 PrefsCustomFolder "${DOTFILES_ROOT_DIR}/osx/iterm2"

# TODO: Possible with absolute paths, not assuming dir?
echo "- Link Spectacle config"
ln -s ~/.dotfiles/.config/spectacle/Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

echo "- Create directories for MPD."
mkdir "$HOME/.mpd"
touch "$HOME/.mpd/log"

echo "- Start MPD automatically on login."
brew services start mpd

echo "- Install osxmpdkeys."
pip install pyobjc-core
pip install osxmpdkeys

echo "  - Install launch agent."
cp ./resources/com.github.pushrax.osxmpdkeys.plist ~/Library/LaunchAgents/

echo "- Disable Chrome history swipe gestures."
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

echo "- Disable TexShop bring to front on update."
defaults write TeXShop BringPdfFrontOnAutomaticUpdate NO

echo
