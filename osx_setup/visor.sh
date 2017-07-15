#!/bin/bash
# Sets up a second iTerm application that can be run

set -e

echo "### ITERM2 VISOR ###"

if [ -z "$DOTFILES_ROOT_DIR" ]; then
	echo "Error: \$DOTFILES_ROOT_DIR is not set."
	exit 1
fi

BID="com.googlecode.iterm2"

ITERM="$(mdfind kMDItemCFBundleIdentifier = "$BID")"
VISOR="$HOME/Applications/iTermVisor.app"

if [ -d "$VISOR" ]; then
    echo '- Found older version, deleting.'
    rm -r "$VISOR"
fi

if [ ! -d "$HOME/Applications" ]; then
    echo '- Creating local Applications folder.'
    mkdir "$HOME/Applications"
fi
echo '- Copying current iTerm.'
cp -r "$ITERM" "$VISOR"

echo '- Modifying plist.'
PLIST="$VISOR/Contents/Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${BID}visor" "$PLIST"
/usr/libexec/PlistBuddy -c "Set :CFBundleName iTerm2Visor" "$PLIST"
#/usr/libexec/PlistBuddy -c "Add :LSUIElement string 1" "$PLIST"

echo '- Setting defaults.'
defaults write com.googlecode.iterm2visor PrefsCustomFolder \
    "${DOTFILES_ROOT_DIR}/osx/iterm2"
