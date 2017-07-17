PROMPT_EXIT_CODE="%(?..\
%{$fg_bold[red]%}%?%{$reset_color%} )"

PROMPT_ROOT_STATUS="%(!.\
%{$fg_bold[red]%}#%{$reset_color%} .)"

PROMPT="\
$fg[blue]┌\
%{$fg[blue]%}┤%n@%{$fg[blue]%}%m├\
$fg[white]─\
$fg[cyan]%}┤%*├\
$fg[white]─\
%{$fg[yellow]%}┤%~├╼
%{$fg[blue]%}└╼%{$reset_color%} "

# Show the correct editor mode on the right hand side of the prompt
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg[blue]%} [% NORMAL]%  %{$reset_color%}"
	RPROMPT="$PROMPT_EXIT_CODE$PROMPT_ROOT_STATUS${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
