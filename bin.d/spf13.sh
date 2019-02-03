#!/usr/bin/env bash
ME=`basename $0` 
CMD=$1
SPF="~/.spf13-vim-3"
    

if [[ $CMD == "install" ]]; then
    curl http://j.mp/spf13-vim3 -L -o - | sh
elif [[ $CMD == "update" ]]; then
    cd $SPF
    git pull
    vim +BundleInstall! +BundleClean +q
    cd -
else
    echo "Undefined command for $ME"
fi





# vim: ft=sh : 
