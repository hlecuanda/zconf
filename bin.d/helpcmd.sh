#!/usr/bin/env sh

HELP_ALTERNATIVES="-h --help -? invalidoption"

for option in $HELP_ALTERNATIVES
do
    $1 $option >/dev/null 2>&1
    if $1 $option >/dev/null 2>&1 ; then
    cmd="$1 $option"
        if [ -z ${TMUX+x} ]; then 
            $cmd |less
        else 
            tmux split-window -vp 25 "exec $cmd | less "
        fi
        break ;
    fi
done

# vim: ft=sh foldmethod=marker foldenable :
