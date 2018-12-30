# vim: ft=tmux foldmarker={,} foldmethod=marker foldlevel=1 foldenable :
# Status bar:
# {2
    set -g status on
#    set -g set-titles on
    set -g set-titles-string '#h'
#    set -g status-utf8 on
    set -g status-interval 60
    set -g status-keys vi
    set -g status-justify left
#    source-file ~/.zconf/tmux.d/statusline.tmux
# end status bar }

