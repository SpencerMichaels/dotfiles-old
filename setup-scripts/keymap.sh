#!/bin/bash
# Sets up Karabiner/Seil and changes the function of a few modifier keys.
#   - Caps lock to esc/ctrl
#   - Ctrl to hyper (shift+ctrl+cmd+alt)
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


echo "- Setting Seil to force capslock to send F19."
/Applications/Seil.app/Contents/Library/bin/seil set keycode_capslock 80

echo "- Linking Karabiner private.xml."
if [ -f $HOME/Library/Application\ Support/Karabiner/private.xml ]; then
    # Delete the file if it exists already -- Karabiner may have created it
    # automatically
    rm $HOME/Library/Application\ Support/Karabiner/private.xml
else
    # Create the directory manually in case Karabiner hasn't done so already
    mkdir -p ~/Library/Application\ Support/Karabiner/
fi
mkdir -p ~/Library/Application\ Support/Karabiner/
ln -s -h ${DOTFILES_OSX_DIR}/karabiner_private.xml $HOME/Library/Application\ Support/Karabiner/private.xml

echo "- Applying Karabiner configuration."
/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml
${DOTFILES_OSX_DIR}/karabiner_config.sh

echo "- Adding F18 shortcut to switch input methods."
# This array of integers, added to the plist below, sets the "switch to next
# input method" hotkey to to F18, which Karabiner's config relies on
HOTKEYS_PLIST="$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"
/usr/libexec/PlistBuddy -c "delete :AppleSymbolicHotKeys:61:value:parameters" "$HOTKEYS_PLIST"
/usr/libexec/PlistBuddy -c "add :AppleSymbolicHotKeys:61:value:parameters array" "$HOTKEYS_PLIST"
/usr/libexec/PlistBuddy -c "add :AppleSymbolicHotKeys:61:value:parameters: integer 65535" "$HOTKEYS_PLIST"
/usr/libexec/PlistBuddy -c "add :AppleSymbolicHotKeys:61:value:parameters: integer 79" "$HOTKEYS_PLIST"
/usr/libexec/PlistBuddy -c "add :AppleSymbolicHotKeys:61:value:parameters: integer 0" "$HOTKEYS_PLIST"

echo "- Changing modifier key behavior."
echo "  - Retrieving internal keyboard IDs."
# I'm not sure this is the best way to get these values. It seems to work, though.
IDS=$(ioreg -p IOUSB -c IOUSBDevice -n "Apple Internal Keyboard / Trackpad" | grep -e idVendor -e idProduct)
echo "$IDS"
ID_PRODUCT=$(echo "$IDS" | sed '1q;d' | sed 's/[^0-9]*//g')
ID_VENDOR=$(echo "$IDS" | sed '2q;d' | sed 's/[^0-9]*//g')

# Clear out the existing defaults for modifier key behavior
defaults -currentHost delete -g com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0 -array

# Caps lock to CTRL
echo "  - Setting capslock to CTRL."
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0 \
    -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'

# CTRL to nothing
echo "  - Setting CTRL to do nothing."
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0 \
    -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>-1</integer><key>HIDKeyboardModifierMappingSrc</key><integer>2</integer></dict>'

exit 0
