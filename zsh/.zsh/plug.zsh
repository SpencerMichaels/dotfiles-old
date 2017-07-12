# TODO: Should I provide an option to auto-install if ~/.zplug is not found?
if source ~/.zplug/init.zsh; then
    zplug "plugins/autojump", from:oh-my-zsh
    zplug "plugins/last-working-dir", from:oh-my-zsh
    zplug "zsh-users/zsh-syntax-highlighting"

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Some plugins are missing. Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    zplug load # --verbose
fi
