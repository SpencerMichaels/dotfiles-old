#!/bin/bash
set -e

echo "- Setting Seil to force capslock to send F19."
/Applications/Seil.app/Contents/Library/bin/seil set keycode_capslock 80

echo "- Linking Karabiner private.xml"
# Create the directory manually in case Karabiner hasn't done so already
mkdir -p ~/Library/Application\ Support/Karabiner/
ln -s -h ${DOTFILES_OSX_DIR}/karabiner_private.xml ~/Library/Application\ Support/Karabiner/private.xml

echo " - Applying Karabiner configuration."
/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml
${DOTFILES_OSX_DIR}/karabiner_config.sh

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
