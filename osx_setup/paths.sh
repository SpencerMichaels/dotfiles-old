#!/bin/bash
set -e

# NOTE: If you place paths.sh somewhere else relative to the rest of the scripts,
# weird stuff will happen. Don't do that.
export DOTFILES_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
