#!/bin/sh
#
# Homebrew installer
set -e

# Check if Homebrew exists
if [ ! $(which brew) ] && [ "$(uname)" = "Darwin" ]
then
echo "- Installing Homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo '- Homebrew is already installed, continuing to packages.'
fi

# Packages/repos to isntall/tap
BREW_TAPS=(
    caskroom/versions   # For iterm2-beta and other such alternate app versions
)
BREW_PACKAGES=(
    grc
    "macvim --with-override-system-vim"
    "mpd --with-flac --with-libmms"
    "ncmpcpp --with-clock --with-visualizer"
    python3
    reattach-to-user-namespace
    tmux
    zsh
)
CASK_PACKAGES=(
    alfred
    google-chrome
    iterm2-beta
    karabiner
    seil
    spectacle
)

echo "- Tapping repositories."
for ((i = 0; i < ${#BREW_TAPS[@]}; i++)); do
    echo "  - Tapping ${BREW_TAPS[i]}."
    brew tap ${BREW_TAPS[i]}
done

echo "- Installing packages."
for ((i = 0; i < ${#BREW_PACKAGES[@]}; i++)); do
    echo "  - Installing ${BREW_PACKAGES[i]}."
    brew install ${BREW_PACKAGES[i]}
done

echo "- Installing cask."
brew install caskroom/cask/brew-cask

echo "- Installing cask apps."
for ((i = 0; i < ${#CASK_PACKAGES[@]}; i++)); do
    echo "  - Installing ${CASK_PACKAGES[i]}."
    brew cask install ${CASK_PACKAGES[i]}
done

echo "- Cleaning up."
brew cleanup

exit 0
