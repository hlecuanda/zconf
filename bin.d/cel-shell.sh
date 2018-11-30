#!/usr/bin/env bash

tmux has-session -t cel > /dev/null

if [ $? ] ; then
    tmux new-session -s cel -n MAIN
    tmux new-window -d -t cel -n WWW links
    exec tmux attach -t cel
else
    exec tmux attach -t cel
fi
exit


# vim: ft=sh.tmux :
