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

# Simplified Chinese Pinyin IME 简体中文拼音輸入法
echo "  - Simplified Chinese Pinyin IME"
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Input Mode</string><key>Bundle ID</key><string>com.apple.inputmethod.SCIM</string><key>Input Mode</key><string>com.apple.inputmethod.SCIM.ITABC</string></dict>'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Keyboard Input Method</string><key>Bundle ID</key><string>com.apple.inputmethod.SCIM</string></dict>'

# Traditional Chinese Pinyin IME 繁體中文拼音輸入法
echo "  - Traditional Chinese Pinyin IME"
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Input Mode</string><key>Bundle ID</key><string>com.apple.inputmethod.TCIM</string><key>Input Mode</key><string>com.apple.inputmethod.TCIM.Pinyin</string></dict>'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Keyboard Input Method</string><key>Bundle ID</key>                <string>com.apple.inputmethod.TCIM</string></dict>'

# Traditional Chinese Zhuyin IME 繁體中文注音輸入法
echo "  - Traditional Chinese Zhuyin IME"
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Input Mode</string><key>Bundle ID</key><string>com.apple.inputmethod.TCIM</string><key>Input Mode</key><string>com.apple.inputmethod.TCIM.Zhuyin</string></dict>'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Keyboard Input Method</string><key>Bundle ID</key>                <string>com.apple.inputmethod.TCIM</string></dict>'

# Chinese handwriting 中文手写
echo "  - Chinese handwriting"
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add \
    '<dict><key>InputSourceKind</key><string>Non Keyboard Input Method</string><key>Bundle ID</key><string>com.apple.inputmethod.ChineseHandwriting</string></dict>'
