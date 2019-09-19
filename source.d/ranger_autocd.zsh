# Automatically change the directory in bash after closing ranger
#
# This is a sourceable function for zsh to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile" &>> /dev/null
}

# This binds Ctrl-O to ranger-cd:
bindkey -M vicmd -s "\C-o" "ranger-cd\C-m"
bindkey -M viins -s "\C-o" "ranger-cd\C-m"
