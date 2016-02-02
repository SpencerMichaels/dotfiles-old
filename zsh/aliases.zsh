alias cl='cd $@ && ls'
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

alias st='it2_switch_theme'
