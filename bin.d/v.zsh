#!/usr/bin/env zsh
[[ ! -o autocontinue ]] \
    && { r=1 ; setopt autocontinue } \
    || true ;
(( ${#argv} == 1 )) && HOST=trantor || HOST=$1
echo "xvncviewer localhost:1 -via $HOST"
xvncviewer localhost:1 -via $HOST -SecurityTypes passwd -- \
    <& - &>! ~/.zconf/logs.d/$1-vnc-$(date +%Y%m%d-%H%M%S).log &
disown
[[ -v $r ]] && unsetopt autocontinue || true
