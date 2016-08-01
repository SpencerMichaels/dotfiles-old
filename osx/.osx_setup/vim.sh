#!/bin/bash
# Installs NeoVim addons through Vim-Plug.

set -e

echo "- Installing Python 2/3 + Python support."
echo "  - Python 2/3"
brew  install python python3
echo "  - Python 2 provider"
pip2 install --upgrade neovim
echo "  - Python 3 provider"
pip3 install --upgrade neovim

echo "- Installing plugins."
nvim +PlugInstall +qall

exit 0
