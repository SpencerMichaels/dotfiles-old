# Justin's prompt. TODO: Figure out what this displays!
PS1="$fg[red]%}[%*]%{$fg[red]%}[%n@%{$fg[red]%}%m]%{$fg[red]%}[%~]
%{$fg[red]%}›%{$fg[red]%}›%{$fg[red]%}›%{$reset_color%} "


# Show the correct editor mode on the right hand side of the prompt
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg[blue]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
