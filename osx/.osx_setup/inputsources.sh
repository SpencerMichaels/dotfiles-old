#!/bin/bash
# Sets up US English and Chinese input sources

# Ensure paths are setup first
set -e
./pathcheck.sh

# Clear existing input sources
echo "- Clearing input sources."
defaults delete com.apple.HIToolbox AppleEnabledInputSources

# US English
echo "- Adding input sources."
echo "  - US English"
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>0</integer><key>KeyboardLayout Name</key><string>U.S.</string></dict>'

# Simplified Chinese 简体中文
echo "  - Simplified Chinese"
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Input Mode</string><key>Bundle ID</key><string>com.apple.inputmethod.SCIM</string><key>Input Mode</key><string>com.apple.inputmethod.SCIM.ITABC</string></dict>'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Keyboard Input Method</string><key>Bundle ID</key><string>com.apple.inputmethod.SCIM</string></dict>'

# Traditional Chinese 繁體中文
echo "  - Traditional Chinese"
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Input Mode</string><key>Bundle ID</key><string>com.apple.inputmethod.TCIM</string><key>Input Mode</key><string>com.apple.inputmethod.TCIM.Pinyin</string></dict>'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Keyboard Input Method</string><key>Bundle ID</key>                <string>com.apple.inputmethod.TCIM</string></dict>'

# Chinese handwriting 中文手写
echo "  - Chinese handwriting"
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Non Keyboard Input Method</string><key>Bundle ID</key><string>com.apple.inputmethod.ChineseHandwriting</string></dict>'
