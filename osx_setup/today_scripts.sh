#!/bin/bash
# Configures defaults for applications. Assumes, of course, that they are
# installed.
set -e

echo "### INSTALL TODAY-SCRIPTS ###"

if [ -z "$DOTFILES_ROOT_DIR" ]; then
	echo "Error: \$DOTFILES_ROOT_DIR is not set."
	exit 1
fi

echo "- Download."
git clone git@github.com:falkvw/Today-Scripts.git /tmp/Today-Scripts

echo "- Build."
cd /tmp/Today-Scripts
xcodebuild -quiet

echo "- Install." 
mv /tmp/Today-Scripts/build/Release/Today\ Scripts.app ~/Applications/

echo "- Link config." 
mkdir -p ~/Library/Containers/org.samroth.Today-Scripts.Widget/Data/Library/
ln -s "$DOTFILES_ROOT_DIR/osx/.config/today-scripts/org.samroth.Today-Scripts.Widget.plist" ~/Library/Containers/org.samroth.Today-Scripts.Widget/Data/Library/org.samroth.Today-Scripts.Widget.plist
