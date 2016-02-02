export EDITOR=vim

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:"        # The usual
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"  # Standard homebrew paths
export PATH="/usr/texbin:$PATH"                     # MacTeX binaries
export PATH="$HOME/Library/Haskell/bin:$PATH"       # Haskell binaries
export PATH="$HOME/.local/bin:$PATH"                # pipsi

export PATH="$HOME/devtools/android-sdks/platform-tools" # ADB
export ANDROID_HOME=/usr/local/opt/android-sdk      # Android SDK

export MANPATH="/usr/local/man:$MANPATH"

eval `/usr/libexec/path_helper -s`                  # Tex paths

# On Mac, load GPG agent information into env vars
if [[ $(uname) == Darwin ]]; then
    if [ -f "${HOME}/.gpg-agent-info" ]; then
        . "${HOME}/.gpg-agent-info"
        export GPG_AGENT_INFO
        export SSH_AUTH_SOCK
    fi
fi

# Tell pinentry where to prompt for the password
export GPG_TTY=$(tty)
