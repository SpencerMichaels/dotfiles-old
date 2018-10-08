# Use Homebrew zplug
export ZPLUG_HOME=/usr/local/opt/zplug

# TODO: Should I provide an option to auto-install if ~/.zplug is not found?
if source $ZPLUG_HOME/init.zsh; then
    zplug "plugins/autojump", from:oh-my-zsh
    zplug "plugins/last-working-dir", from:oh-my-zsh
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "lib/git.zsh", from:oh-my-zsh
    #zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh"

    zplug check || zplug install

    zplug load
fi

# TMUXINATOR_PATH=$(gem path tmuxinator 2>&1)
# if [ $? -eq 0 ]; then
#     source $TMUXINATOR_PATH/completion/tmuxinator.zsh
# fi
# unset TMUXINATOR_PATH
