# Ignore additional whitespace when writing to hist file
setopt histignorealldups
# Share history between terminals
setopt sharehistory
# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Use vi keybindings instead of emacs(default)
bindkey -v
# When searching history with the arrow keys, filter by already-typed text
bindkey '^[[A' up-line-or-search                                                
bindkey '^[[B' down-line-or-search
# Allow deletion past the insert point in vi mode
bindkey "^?" backward-delete-char
