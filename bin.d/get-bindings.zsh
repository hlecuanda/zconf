#!/usr/bin/env zsh
#
# setopt verbose xtrace
function extract-bindings() {
  foreach m in $(bindkey -l) 
  do
    echo "::::::::::::::::::::::::::::::::::::::::: $m  ::::::: "
    bindkey -M $m -L
    echo ,
    echo ,
  done
}

function new-bindings() {
  foreach m in $(bindkey -l) 
  do
    print
    print -P "S%F{cyan}::::::::::::::::::::::::::::::::::::::::: %f%F{yellow} $m %f%F{cyan} ::::::: %f"
    for ka in $(bindkey -M ${m} | tr -d \" )
        echo ${(w)ka} | awk '{print $1 a $2}'
        # print -P $(printf "a %s , b %s" ${=ka})
        # print -P %F{magenta}$ka[1]%F{green}=>%B%F{grey}$ka[2]%b
    print -P E"%F{cyan}::::::::::::::::::::::::::::::::::::::::: %f%F{yellow} $m %f%F{cyan} ::::::: %f"
    print
  done
}
# new-bindings 
extract-bindings |
grep -v emacs    |
grep -v self-insert

# unsetopt xtrace verbose
#  vim: set ft=zsh sw=4 tw=0 fdm=syntax et :
