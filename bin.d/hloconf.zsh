#!/usr/bin/env zsh
#  _     _                        __ 
# | |__ | | ___   ___ ___  _ __  / _|
# | '_ \| |/ _ \ / __/ _ \| '_ \| |_ 
# | | | | | (_) | (_| (_) | | | |  _|
# |_| |_|_|\___/ \___\___/|_| |_|_|  
# h@h-lo.me 20180218 000317 -0800 PST 1518940997 d(-_- )b... 
# Edit configuration files in a tmuxy way if inside tmuxx
# or in a borng way if not.
local mancmd 
local vimcmd
local vdir=$home
local tdir=~/src/Dotfiles/dotfiles/tmux.d

case ${1:-none} in
  (zshell)
    vimcmd="exec vim ${ZDOTDIR}/z{shenv,profile,shrc,preztorc,login,logout}"
    mancmd="exec man zshall"
    ;;
  (tmux)
    vimcmd="exec vim $tdir/tmux.conf"
    mancmd="exec man tmux"
    ;;
  (vim)
    vimcmd="exec vim $vdir/vimrc.*"
    mancmd="exec man vim"
    ;;
  (*)
    # echo <<-EOF
    # usage:

    # hloconf [vim|tmux|zshell]

    # Edits the confguration files for these tools in a 
    # tmuxy way. If invoked wthin a tmux session, it will
    #   -create a new window
    #   -split such window in two panes, 66%/33% vertically
    #   -exec vim on the larger pane with config files open
    #   -exec man for the tool you're editing config for
    #   -create a third pane on the 33% split, also 33%
    #    in height, so you can do REPL or something.

    # If invoked outside tmux, open the config files for tool.
    # boringly.

    # EOF
    # exit 1
    # ;;
esac

if (( ${+TMUX} && ${+vimcmd} )) ; then
  tmux new-window -n ${0} "${mancmd}"
  tmux split-window -h -p 66 "${vimcmd}"
  tmux split-window -v -t 1 -p 33 -d
  tmux select-pane -t 1
else
  ${vimcmd}
fi
unset tdir vdir vimcmd mancmd
exit 0


#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
