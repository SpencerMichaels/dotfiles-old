#!/bin/bash
# Sets decent defaults for OSX

echo "- Don't save to iCloud."
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "- Disable file extension change warning."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "- Always show file extensions in Finder."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "- Disable press-and-hold for accented characters."
defaults write -g ApplePressAndHoldEnabled -bool false

echo "- Disable TexShop bring to front on update."
defaults write TeXShop BringPdfFrontOnAutomaticUpdate NO

echo "- Enable tab controls for all dialogs."
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "- Expand General, Open with, and Sharing & Permissions panes in Finder info window."
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

echo "- Use list view in all Finder windows."
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "- Use current directory as Finder default search scope."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "- Unhide ~/Library."
chflags nohidden ~/Library

echo "- Set default Finder location to home folder."
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
defaults write com.apple.finder NewWindowTarget -string "PfHm"

echo "- Align dock to left and enable autohide."
defaults write com.apple.Dock orientation -string "left"
defaults write com.apple.dock autohide -bool true

echo "- Show POSIX path in Finder."
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

echo "- Minimize windows into their application’s icon, use scale effect."
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mineffect -string "scale"

echo "- Disable transparency."
defaults write com.apple.universalaccess reduceTransparency -bool true

echo "- Disable Chrome history swipe gestures."
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

echo "- Set clock to show date."
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d  h:mm a"

echo "- Enable tap-to-click on login screen (needs root password)."
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
