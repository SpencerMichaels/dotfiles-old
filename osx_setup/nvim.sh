#!/bin/bash
# Installs NeoVim addons through Vim-Plug.

set -e

echo "### NEOVIM ###"

echo "- Install Python 2 and 3."
brew  install python python3

echo "- Install Python support for Neovim."
echo "  - Python 2 provider"
pip2 install --upgrade neovim
echo "  - Python 3 provider"
pip3 install --upgrade neovim

echo "- Install vim-plug."
git clone git@github.com:junegunn/vim-plug.git /tmp/vim-plug
cp /tmp/vim-plug/plug.vim ~/.config/nvim/autoload/plug.vim

echo "  - Installing plugins."
nvim +PlugInstall +qall

echo

exit 0
