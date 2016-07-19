function mkcd
{
    dir="$*"
    mkdir -p "$dir" && cd "$dir"
}

alias cask='brew cask'
alias oh='open .' # Open the current directory in Finder

alias wolfram='/Applications/Mathematica.app/Contents/MacOS/WolframKernel'

alias urldec='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlenc='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

alias cl='cd $@ && ls'
alias cls='clear; ls'
alias ec='emacsclient --no-wait'
alias cs='mpc | head -1'

alias beep='afplay /System/Library/Sounds/Ping.aiff'

alias avrd='avrdude -P usb -c dragon_jtag -p usb1287'

alias vim='nvim'
