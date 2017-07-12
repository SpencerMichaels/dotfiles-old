# Ignore additional whitespace when writing to hist file
setopt histignorealldups
# Share history between terminals
setopt sharehistory
# Use vi keybindings instead of emacs(default)
bindkey -v

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
