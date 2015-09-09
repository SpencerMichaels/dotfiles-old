# Dotfiles
This repository contains my dotfiles, as well as a script for linking them
conveniently.

## Linking
link.sh allows the user to keep dotfiles in a centralized folder by creating
symlinks to them in the home directory (where they are typically expected).
For any file/folder F.symlink in this folder or its subdirectories, a symlink
~/.F will be created.

## ~/.gitprivate file
To avoid exposing git usernames, emails, etc., the .gitconfig within this
repository [include]s a ~/.gitprivate file. This should contain git's [user]
configuration and anything else sensitive, and is not in this repository.

## zsh configuration
The zsh scripts expect oh-my-zsh to reside in ~/.oh-my-zsh.
