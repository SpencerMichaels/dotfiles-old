function mkcd
{
    dir="$*"
    mkdir -p "$dir" && cd "$dir"
}

alias beep='afplay /System/Library/Sounds/Ping.aiff'
alias cask='brew cask'
alias cls='clear; ls'
alias oh='open .'
alias urldec='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlenc='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vim='nvim'

# CLI knox replacement
alias hdc="hdiutil create -size 1g -encryption AES-256 -type SPARSE -fs HFS+"
alias hda="hdiutil attach"
alias hdd="hdiutil detach"
alias hdr="diskutil rename"

# pretty print things
alias pp_json="python -m json.tool"
alias pp_js="js-beautify"
alias pp_xml="xmllint --format -"

# Enable modern node.js features
alias node="node --harmony"
alias le="exa"

# TODO: What does this do?
# alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# These are custom vim mode key bindings
bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line
