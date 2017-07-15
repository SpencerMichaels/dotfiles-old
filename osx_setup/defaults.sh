#!/bin/sh
# Run this script as a regular user.

echo "### SET OS X DEFAULTS ###"

#echo "- Automatically allow apps downloaded from anywhere (NOTE: disables Gatekeeper)."
#sudo spctl --master-disable

echo "- Configure Finder."
#echo "  - Show hidden files."
#defaults write com.apple.Finder AppleShowAllFiles TRUE
#echo "  - Show the pathbar at the bottom."
#defaults write com.apple.Finder ShowPathbar -bool true
echo "  - Show the curent path in the title bar."
defaults write com.apple.Finder _FXShowPosixPathInTitle -bool true
echo "  - Show all file extensions."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
echo "  - Don't warn when emptying the trash."
defaults write com.apple.Finder WarnOnEmptyTrash -bool false
echo "  - Don't warn when changing file extensions."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
echo "  - Don't show desktop icons"
defaults write com.apple.finder CreateDesktop -bool false
echo "  - Show icons for external hard drives, servers, and removable media."
#defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
echo "  - Set the default Finder location to the home folder."
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
echo "  - Use list view in all Finder windows."
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
echo "  - Use the current directory as the default search scope."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
echo "  - Expand the General, Open with, and Sharing & Permissions panes in Finder info window."
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true
echo "  - Show ~/Library, /tmp, and /usr."
chflags nohidden ~/Library/
sudo chflags nohidden /tmp
sudo chflags nohidden /usr
echo "- Restart Finder."
killall Finder

echo "- Configure the Dock."
echo "  - Don't automatically rearrange spaces based on most recent use."
defaults write com.apple.dock mru-spaces -bool false
echo "  - Shorten Exposé animation duration."
defaults write com.apple.dock expose-animation-duration -float 0.15
echo "  - Auto-hide (quickly)."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.17
echo "  - Increase the autohide delay."
defaults write com.apple.dock autohide-delay -float 0.25
echo "  - Disable the dashboard."
defaults write com.apple.dock "dashboard-in-overlay" -bool true
echo "  - Pin to the left."
defaults write com.apple.dock orientation left
defaults write com.apple.dock pinning -string start
echo "  - Clear all Dock icons."
defaults write com.apple.dock persistent-apps -array
echo "  - Minimize windows into their application’s icon; use scale effect."
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mineffect -string "scale"
echo "  - Restart the Dock."
killall Dock

echo "- Configure globals."
echo "  - Allow keyboard navigation for all dialogs."
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
echo "  - Reduce window resize time."
defaults write NSGlobalDomain NSWindowResizeTime .1
echo "  - Disable press-and-hold."
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
echo "  - Set key repeat speed to maximum."
defaults write NSGlobalDomain KeyRepeat -float 0.001
echo "  - Disable spell check."
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
echo "  - Disable shake to locate cursor."
defaults write CGDisableCursorLocationMagnification -bool YES

echo "- Enable tap-to-click."
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
echo "- Enable tap-to-click on the login screen."
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

echo "- Don't warn when opening an app downloaded from the internet."
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "- Don't write .DS_Store files to network shares."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "- Don't prompt to make new external drives into Time Machine backups."
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "- Disable drop shadow on screenshots."
defaults write com.apple.screencapture disable-shadow -bool true

echo "- Disable transparency."
defaults write com.apple.universalaccess reduceTransparency -bool true

echo "- Don't offer to save new documents to iCloud."
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "- Check for updates daily."
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "- Ask for password immediately after screen lock."
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "- Hide the Time Machine icon."
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
    defaults write "${domain}" dontAutoLoad -array \
        "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
done

echo "- Set clock to show date."
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d  h:mm a"

echo "- Show battery percentage."
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

echo "- Link the airport binary."
sudo mkdir -p /usr/local/bin
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport

# Disable "safe sleep", saving 8-16G of disk space. Doing so is basically no
# less secure than the default behavior when it comes to cold boot attacks, as
# Safe Sleep leaves the RAM powered for 24 hours anyway. You'd have to hibernate
# every time you close the machine to prevent that. If you want to do that, use
# this:
#
# sudo pmset -a destroyfvkeyonstandby 1 hibernatemode 25 autopoweroff 0
#
# You can also use autopoweroff and reduce the autopoweroffdelay if you want
# to sleep -> hibernate after a period of time.
#
# Or you can do this to save space.
# pmset -a hibernatemode 0
# pmset -a autopoweroff 0
# rm /private/var/vm/sleepimage
# sudo touch /private/var/vm/sleepimage
# sudo chflags uchg /private/var/vm/sleepimage

# Uncomment for dark mode
# sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

echo
