# Dotfiles
This repository contains my dotfiles, as well as scripts for setting up
a new Mac with my preferred configurations automatically.

## DISCLAIMER
These auto-setup scripts are developed for my personal use, and have only been
verified to work on my particular Macbook hardware and operating system
version, _after a fresh install_. Some of the configuration methods either use
**undocumented APIs** or **modify plist files directly**, and the script does
not assume that the user has settings already in place. Do not run these
scritpts unless you've looked at them thoroughly; serious trouble will almost
certainly occur otherwise.

Each section of configuration resides in its own script, although some depend
on each other (e.g. `vim.sh` requires `brew.sh` to have installed `vim` first).
If you'd like to run a script manually, source `paths.sh` in the main directory
first to setup path variables necessary for the scripts to access the proper
directories.

## ~/.gitprivate file
To avoid exposing git usernames, emails, etc., the .gitconfig within this
repository [include]s a ~/.gitprivate file. This should contain git's [user]
configuration and anything else sensitive, and is not in this repository.

## Credits
ZSH sourcing methods based on those in [holman/dotfiles](https://github.com/holman/dotfiles).
