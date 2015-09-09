#!/bin/sh
#
# Homebrew installer

# Check if Homebrew exists
if test [ ! $(which brew) ] && [ "$(uname)" = "Darwin" ]
then
    echo 'Installing Homebrew.'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo 'Homebrew is already installed.'
fi

exit 0
