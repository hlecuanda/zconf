

unbind C-L 
bind C-L source-file $TMUX_DIR/kbd-left-reset.tmux


bind -n T send-keys "y"
bind -n R send-keys "u"
bind -n E send-keys "i"
bind -n W send-keys "o"
bind -n Q send-keys "p"

bind -n G send-keys "h"
bind -n F send-keys "j"
bind -n D send-keys "k"
bind -n S send-keys "l"
bind -n A send-keys "ñ"


bind -n B send-keys "n"
bind -n V send-keys "m"
bind -n C send-keys ","
bind -n X send-keys "."
bind -n Z send-keys "-"

bind -n M-B send-keys "N"
bind -n M-V send-keys "M"
bind -n M-C send-keys ";"
bind -n M-X send-keys ":"
bind -n M-Z send-keys "_"


# vim: ft=tmux :

