#!/usr/bin/env bash
# vim : ft=tmux.sh :

function cmd_help() {
    cat ~/bin/fix-black-mac-keys |
    grep -v \# |
    sed -Ee "/^\ +/s///" |
    grep -Ee "^tmux" |
    sed -Ee "s/tmux\ bind/    o /"|
    sed -Ee "s/send-keys/will send /"
}

if [[ $1 == "verbose" ]]; then
    kset -v
fi

if [[ $1 == "help" ]]; then
    cmd_help
fi

if [[ $TMUX ]]; then
    # Running inside tmux
    tmux bind S-Down send-keys Up  ;
    # tmux bind Ç    send-keys Space ;
else
    # Runnig outside tmux
    echo "Must b running inside tmux!!"
fi



