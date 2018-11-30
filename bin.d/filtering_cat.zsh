#!/usr/bin/env zsh

function echo() {
    /bin/echo $1 > /dev/null
}

function main() {
    disable -f echo
        cat $1 |
        grep -Ee "[^[:space:]]" |
        while read line
        do
           if [[ $line == '<!DOCTYPE html>' ]]; then
               disable echo
               enable -f echo # builtin overridden
           fi
           echo $line
        done
    disable -f echo
    enable echo # builtin in effect
    exit 0
}

main $1

