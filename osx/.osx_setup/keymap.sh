#!/bin/bash
# Sets up Karabiner/Seil and changes the function of a few modifier keys.
#   - Caps lock to esc/ctrl
#   - Ctrl to hyper (shift+ctrl+cmd+alt)

set -e

# Ensure paths are setup first
source paths.sh

echo "- Setting Seil to force capslock to send F19."
/Applications/Seil.app/Contents/Library/bin/seil set keycode_capslock 80

echo "- Linking Karabiner private.xml."
mkdir -p ~/Library/Application\ Support/Karabiner/
cp karabiner_private_stub.xml $HOME/Library/Application\ Support/Karabiner/private.xml

echo "- Applying Karabiner configuration."
/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml
karabiner_config.sh

echo "- Applying Seil configuration."
seil_config.sh

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
# I'm not sure this is the best way to get these values. It seems to work, though.
IDS=$(ioreg -p IOUSB -c IOUSBDevice -n "Apple Internal Keyboard / Trackpad" | grep -e idVendor -e idProduct)
echo "$IDS"
ID_PRODUCT=$(echo "$IDS" | sed '1q;d' | sed 's/[^0-9]*//g')
ID_VENDOR=$(echo "$IDS" | sed '2q;d' | sed 's/[^0-9]*//g')
DEFAULTS_DOMAIN="com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0"

# Clear out any existing defaults for modifier key behavior
if defaults -currentHost read -g com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0 > /dev/null;
then
    echo "  - Cleared existing defaults."
    defaults -currentHost delete -g com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0
fi
defaults -currentHost write -g $DEFAULTS_DOMAIN -array

# Caps lock to CTRL
echo "  - Setting capslock to CTRL."
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0 \
    -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'

# CTRL to nothing
echo "  - Setting CTRL to do nothing."
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${ID_VENDOR}-${ID_PRODUCT}-0 \
    -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>-1</integer><key>HIDKeyboardModifierMappingSrc</key><integer>2</integer></dict>'

exit 0
