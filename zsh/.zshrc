# Online help for zsh
HELPDIR=/usr/local/share/zsh/helpfiles

export ZSH=$HOME/.zsh

# Load zsh configuration files ------------------------------------------------
typeset -U config_files
config_files=($ZSH/*.zsh)

# Load path files
for file in ${(M)config_files:#*/env.zsh}
do
    source $file
done

# Load files, excluding env and completion
for file in ${config_files:#*/completion.zsh}
do
    source $file
done

# Initialize autocomplete
autoload -U compinit
compinit

# Load completion files
for file in ${(M)config_files:#*/completion.zsh}
do
    source $file
done

unset config_files

# Init fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
