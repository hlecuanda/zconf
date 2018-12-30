#!/usr/bin/env zsh

typeset -a sections
sections=( bindings init status cmds colors keys )

function build () {
    cat ${1}            |
    grep -vEe '\s?\#'   |
    sed -Ee 's/^\s+//i' |
    tr -s \             |
    grep -v -Ee '^$'
}

[[ -f tmux.conf  ]] && rm -fv tmux.conf

for section in ${sections}; do
    print -f "\nBuilding %s\n" ${section}
    for file in $(ls ./${section}/0*.tmux); do
        print -f "%s-> %s \n" ' ' ${file:t:r}
        build ${file} >>! tmux.conf
    done
done
return 0
