# Dotfiles
This repository contains my configuration files for Mac OS X and various
command line utilities, organized for use with GNU `stow`. Scripts are
also included for setting up a new Mac with my preferred configurations
automatically.

To use, run the following:
```
git clone https://github.com/sxmichaels/dotfiles ~/.dotfiles
~/.dotfiles/osx_setup/main.sh
```

## ~/.gitprivate file
To avoid exposing git usernames, emails, etc., the .gitconfig within this
repository [include]s a ~/.gitprivate file. This should contain git's [user]
configuration and anything else sensitive, and is not in this repository.

## Credits
* ZSH dynamic sourcing methods from [Zach Holman](https://github.com/holman/dotfiles).
* tmux, vim, and zsh configs from [Justin Moore](https://github.com/jm00re/dotfiles).
* OS X defaults from [lxcode](https://github.com/lxcode/dotfiles/blob/master/fix_osx.sh).
