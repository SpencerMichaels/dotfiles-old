#!/bin/bash
# Installs NeoVim addons through Vim-Plug.

set -e

echo "### NEOVIM ###"

echo "- Install Python support for Neovim."
echo "  - Python 2 provider"
pip2 install --upgrade neovim
echo "  - Python 3 provider"
pip3 install --upgrade neovim

echo "- Install vim-plug."
git clone https://github.com/junegunn/vim-plug.git /tmp/vim-plug
mkdir -p ~/.config/nvim/autoload
cp /tmp/vim-plug/plug.vim ~/.config/nvim/autoload/plug.vim

echo "  - Installing plugins."
nvim +PlugInstall +qall

echo

exit 0
