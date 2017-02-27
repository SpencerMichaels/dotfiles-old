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

alias vim='nvim'

alias vme='docker exec -it nSERVER /bin/bash'
alias vms='docker-compose up -d'
alias vmk='docker-compose down'
alias vmr='docker-compose down && docker-compose up -d'
alias vml='docker logs -f nSERVER'

alias iclpwifi='echo L05S21075 | pbcopy'
