
alias cl='cd $@ && ls'
function mkcd
{
    dir="$*"
    mkdir -p "$dir" && cd "$dir"
}

alias cask='brew cask'
alias oh='open .' # Open the current directory in Finder

alias wolfram='/Applications/Mathematica.app/Contents/MacOS/WolframKernel'
