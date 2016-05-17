#!/bin/bash
# Sets up Hammerspoon and its addons

# Ensure paths are setup first
set -e
./pathcheck.sh

echo "- Installing undocumented Spaces functionality."
echo "  - Installing dependencies."
brew install homebrew/versions/lua53

git clone https://github.com/asmagill/hammerspoon_asm.undocumented.git \
    /tmp/hammerspoon_asm.undocumented
(
    cd /tmp/hammerspoon_asm.undocumented
    git submodule init
    git submodule update
    cd spaces
    HS_APPLICATION=~/Applications PREFIX=~/.hammerspoon make install
)

exit 0
