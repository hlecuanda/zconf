#!/usr/bin/env zsh

# if ( { tmux has-session -t  "${TMUX_SESSION}" } ) set itsme

if ((${+TMUX_SESSION})); then
    if [[ $1 == ${TMUX_SESSION} ]]; then
        tmux attach-session -dt "${TMUX_SESSION}"
        set session_msg = "Reattached to ${TMUX_SESSION}"
    fi
else

    (( $# == 0 )) && setenv TMUX_SESSION $USER
    (( $# == 1 )) && setenv TMUX_SESSION $1

    set session_msg = "New session: ${TMUX_SESSION}"

    switch ("${TMUX_SESSION}")
        case H-Lo:
        case HLO:
        case tmux-start:
            tmux new-session -d -s "${TMUX_SESSION}"
            # tmux new-window -dt "${TMUX_SESSION}:9" -n "EDITOR"  "vim --servername VIM"
            # tmux new-window -dt "${TMUX_SESSION}:3" -n Passport "/usr/bin/ssh passport"
            # tmux new-window -dt "${TMUX_SESSION}:4" -n Trantor  "/usr/bin/ssh trantor"
            # tmux new-window -dt "${TMUX_SESSION}:5" -n IRC      "irssi"
            breaksw

        case iph:
            tmux new-session -d -s "${TMUX_SESSION}" -x 25 -y 13
            breaksw

        default:
            tmux new-session -d
            breaksw
    endsw

if

tmux set-environment  -t  "${TMUX_SESSION}" TMUX_SESSION       "${TMUX_SESSION}"
tmux set-environment  -t  "${TMUX_SESSION}" PARENT_SHELL_PID   "${MYPID}"
tmux set-option       -t  "${TMUX_SESSION}" utf8 on
tmux attach-session   -dt "${TMUX_SESSION}"
tmux select-window    -t  "${TMUX_SESSION}:1"
tmux run-shell            "figlet ${session_msg}"
tmux display-message  ${session_msg}

# vim: set ft=zsh.tmux sw=4 tw=0 fdm=manual nowrap et :
