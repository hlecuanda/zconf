# vim: ft=tmux foldmarker={,} foldmethod=marker foldlevel=1 foldenable :

#{2
    set -g buffer-limit 8
    set -g set-clipboard on
    set -g message-limit 300
    set -g escape-time 300
    set -g exit-unattached off
#    set -g quiet off
# } end global server options

# {1
    # Misc Defaults:  {
        # set -g default-command 'exec /usr/local/bin/zsh -o login'
        set -g default-shell '/usr/bin/zsh'
        set -g default-terminal 'screen-256color'
        set -g destroy-unattached off
        set -g detach-on-destroy on
        set -g history-limit 5000
        set -g repeat-time  2500
        set -g xterm-keys off
        set -g terminal-overrides "*:clear=\e[H\e[2J,rxvt*:dch1=\e[P*,colors=88,*88col*:colors=88,*256col*:colors=256,xterm*:XT"
        set -g display-panes-time 1000
        set -g base-index 1
        set -g pane-base-index 1
        #set -s utf8 on
    # end misc defaults }


    # Locking:  {
        #set -g lock-after-time number
        #set -g lock-command shell-command
        #set -g lock-server [on | off]
    # } end Locking

    # Mouse  {
        set -g mouse on
#        set -g mouse-utf8 on
    # end mouse }

    # Visual alerts & bindings for them: {
        set -g bell-action any
#        set -g bell-on-alert on
        set -g visual-activity on
        set -g visual-bell off
        # set -g visual-content on
        set -g visual-silence on
        set -g display-time 1500

    # }
# end global session options


#{2
    set -g buffer-limit 8
    set -g set-clipboard on
    set -g message-limit 300
