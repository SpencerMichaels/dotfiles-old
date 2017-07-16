#!/bin/bash
# Configures defaults for applications. Assumes, of course, that they are
# installed.
set -e

echo "### INSTALL TODAY-SCRIPTS ###"

source paths.sh

if [ -z "$DOTFILES_ROOT_DIR" ]; then
	echo "Error: \$DOTFILES_ROOT_DIR is not set."
	exit 1
fi

echo "- Download."
git clone https://github.com/falkvw/Today-Scripts.git /tmp/Today-Scripts

echo "- Build."
cd /tmp/Today-Scripts
xcodebuild -quiet

echo "- Install." 
mkdir -p ~/Applications
mv /tmp/Today-Scripts/build/Release/Today\ Scripts.app ~/Applications/

# TODO: Where is the new config?
#echo "- Link config." 
#mkdir -p ~/Library/Containers/org.samroth.Today-Scripts.Widget/Data/Library/
#ln -s "$DOTFILES_ROOT_DIR/osx/.config/today-scripts/org.samroth.Today-Scripts.Widget.plist" ~/Library/Containers/org.samroth.Today-Scripts.Widget/Data/Library/org.samroth.Today-Scripts.Widget.plist
