# See https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="m" # TODO
ZSH_THEME_GIT_PROMPT_RENAMED="↺"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STASHED="$"
ZSH_THEME_GIT_PROMPT_UNMERGED="U" # TODO
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="↑"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="↓"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="⇅"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="%{$fg[green]%}=%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# See https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh#L2
function git_prompt_info2() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function prompt_dynamic_section {
  local git_status="$(git_prompt_info) $(git_remote_status)"
	local dprompt=""

	if [ "$git_status" != " " ]; then
    dprompt+="%{$fg[white]%}on $git_status"
	fi
		
	# Add an extra separator if there is content available
	if [ "$dprompt" != "" ]; then
		dprompt=" $dprompt"
	fi

	echo "$dprompt"
}

function set_prompt {
    VIM_PROMPT="%{$fg_bold[blue]%}NORMAL%{$reset_color%} "

    # Can also use %(4~|.../%3~|%~) or %(5~|%-1~/…/%3~|%4~)
    ((PATH_LEN = `tput cols` - 40))
	PROMPT="\
%{$fg[yellow]%}%n\
%{$fg[white]%} at \
%{$fg[green]%}%m\
%{$fg[white]%} in \
%{$fg[blue]%}%${PATH_LEN}<..<%~%<<\
$(prompt_dynamic_section)
%(?.%{$fg[green]%}.%{$fg[red]%})%(#.#.➜)%{$reset_color%} "

	#RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
}

# Show the correct editor mode on the right hand side of the prompt
function zle-line-init zle-keymap-select {
	set_prompt
    #zle reset-prompt
}
set_prompt

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
