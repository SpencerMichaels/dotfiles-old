# Online help for zsh
HELPDIR=/usr/local/share/zsh/helpfiles

export ZSH=$HOME/.zsh

# Load zsh configuration files ------------------------------------------------
typeset -U config_files
config_files=($ZSH/*.zsh)

# Load path files
#for file in ${(M)config_files:#*/env.zsh}
#do
#    source $file
#done

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

# Source oh-my-zsh last -- the files loaded above can contain its configuration
source $ZSH/oh-my-zsh.sh

unset config_files

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
