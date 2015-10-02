#!/bin/bash

echo "- Disabling Chrome history swipe gestures."
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

echo "- Enabling tap-to-click on login screen (needs root password)."
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

echo "- Setting clock to show date."
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d  h:mm a"
