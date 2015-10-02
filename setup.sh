#!/bin/bash
set -e

export DOTFILES_ROOT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export SETUP_SCRIPTS_DIR=$DOTFILES_ROOT_DIR/setup-scripts
export DOTFILES_OSX_DIR=$DOTFILES_ROOT_DIR/osx

$SETUP_SCRIPTS_DIR/main.sh
