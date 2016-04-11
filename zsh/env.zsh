export EDITOR=vim

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:"        # The usual
eval `/usr/libexec/path_helper -s`                  # Tex paths
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"  # Standard homebrew paths

export PATH="$HOME/devtools/android-sdks/platform-tools:$PATH" # ADB
export ANDROID_HOME=/usr/local/opt/android-sdk      # Android SDK

# Brewed Mac Emacs
export PATH="/usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.15/bin:$PATH"

export MANPATH="/usr/local/man:$MANPATH"

# The current version of gpg-agent causes errors in ssh-agent, so the following
# is disabled for now. See https://bugzilla.redhat.com/show_bug.cgi?id=1274245.
# On Mac, load GPG agent information into env vars
#if [[ $(uname) == Darwin ]]; then
#    if [ -f "${HOME}/.gpg-agent-info" ]; then
#        . "${HOME}/.gpg-agent-info"
#        export GPG_AGENT_INFO
#        export SSH_AUTH_SOCK
#    fi
#fi

# Tell pinentry where to prompt for the password
#export GPG_TTY=$(tty)
