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


BID="com.googlecode.iterm2"

ITERM="$(mdfind kMDItemCFBundleIdentifier = "$BID")"
VISOR="$HOME/Applications/iTermVisor.app"

if [ -d "$VISOR" ]; then
    echo '- Found older version, deleting.'
    rm -r "$VISOR"
fi
echo '- Copying current iTerm.'
cp -r "$ITERM" "$VISOR"

echo '- Modifying plist.'
PLIST="$VISOR/Contents/Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${BID}visor" "$PLIST"
/usr/libexec/PlistBuddy -c "Add :LSUIElement string 1" "$PLIST"

echo '- Setting defaults.'
defaults write com.googlecode.iterm2visor PrefsCustomFolder "${DOTFILES_ROOT_DIR}/osx/iterm2"
