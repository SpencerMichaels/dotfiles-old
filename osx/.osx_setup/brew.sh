#!/bin/sh
# Installs homebrew and a few packages needed for basic work

set -e

# Ensure paths are setup first
source paths.sh

# Check if Homebrew exists
if [ ! $(which brew) ] && [ "$(uname)" = "Darwin" ]
then
echo "- Installing Homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo '- Homebrew is already installed, continuing to package installation.'
fi

# Packages/repos to install/tap
BREW_TAPS=(
    caskroom/fonts      # For Hack font
    caskroom/versions   # For iterm2-beta and other such alternate app versions
)
BREW_PACKAGES=(
    ack
    autojump
    ctags
    duti
    grc
    mpc
    "mpd --with-flac --with-libmms"
    "ncmpcpp --with-clock --with-visualizer"
    "neovim/neovim/neovim"
    reattach-to-user-namespace
    stow
    tmux
    wget
    zsh
)
CASK_PACKAGES=(
    alfred
    firefox
    font-hack
    iterm2
    karabiner
    mactex
    seil
    spectacle
    the-unarchiver
)

echo "- Tapping repositories."
for ((i = 0; i < ${#BREW_TAPS[@]}; i++)); do
    echo "  - ${BREW_TAPS[i]}"
    brew tap ${BREW_TAPS[i]}
done

echo "- Installing packages."
for ((i = 0; i < ${#BREW_PACKAGES[@]}; i++)); do
    echo "  - ${BREW_PACKAGES[i]}"
    brew install ${BREW_PACKAGES[i]}
done

echo "- Installing cask apps."
for ((i = 0; i < ${#CASK_PACKAGES[@]}; i++)); do
    echo "  - ${CASK_PACKAGES[i]}"
    brew cask install ${CASK_PACKAGES[i]}
done

echo "- Linking cask apps."
brew linkapps

echo "- Cleaning up."
brew cleanup

exit 0
