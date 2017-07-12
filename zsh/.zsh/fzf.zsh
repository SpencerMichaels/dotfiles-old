# ag/fzf helpers
alias strip_after_colon="awk -F':' '{print \$1}'"
alias strip_color_codes="perl -pe 's/\e\[?.*?[\@-~]//g'"

# better fzf functions
alias get_ag_files="strip_after_colon | strip_color_codes | uniq"

# ag | fzf | vim
afv() {
    if [ -t 0 ]; then
        return
    else
        fzf --ansi -m | strip_color_codes | awk -F':' '{print ":e "$1"|:"$2i"|"}' | tr -d '\n' |
        xargs -I {} bash -c '</dev/tty vim -c "{} | redraw"' ignoreme
    fi
}

# TODO: What does this do?
va() {
    if [ -t 0 ]; then
        return
    else
        strip_color_codes | awk -F':' '{print ":e "$1"|:"$2i"|"}' | tr -d '\n' |
        xargs -I {} bash -c '</dev/tty vim -c "{} | redraw"' ignoreme
    fi
}

# Filter input lines by given length
filter_length() {
    awk -v var="$1" "length(\$0) < var"
}

# This fixes an issue with truecolor support
alias fzf="TERM=screen-256color fzf"
export FZF_DEFAULT_COMMAND='ag --no-color -g *'

# fzf + cd
# TODO: this doesn't actualy work how i want it to
function fd() {
    local dir
    if [ "$#" -eq 0 ]
    then
        dir=$(find -L ${1:-.} -type d 2> /dev/null | fzf ) && cd "$dir"
        print $dir
    elif [ "$#" -eq 1 ]
    then
        if [ "$1"=".." ]
        then
            get_parent_dirs() {
                if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
                if [[ "${1}" == '/' ]]; then
                    for _dir in "${dirs[@]}"; do echo $_dir; done
                else
                    get_parent_dirs $(dirname "$1")
                fi
            }
            local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf)
            cd "$DIR"
            print "$DIR"
        else
            dir=$(find -L ${1:-.} -type d 2> /dev/null | fzf --filter=$1 | head -1) && cd "$dir"
            print $dir
        fi
    fi
}

# fzf -> open file in vim
function vf() {
    if [ "$#" -eq 0 ]
    then
        # This little chunk here is magic
        files=( "${(@f)$(fzf -m)}" )
        if [ -z $files ]
        then
        else
            print $files
            vim -- $files
        fi
    elif [ "$#" -eq 1 ]
    then
        file=$(fzf --filter=$1 | head -1)
        if [ -z $file ]
        then
        else
            print $file
            vim -- $file
        fi
    fi
}

# Init fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
