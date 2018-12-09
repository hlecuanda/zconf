bind-key 1 choose-tree 
bind-key 2 choose-client
bind-key 3 choose-session
bind-key 4 choose-window
bind-key 5 choose-buffer
bind-key - send-keys _
bind-key / send-keys '\'
bind-key : send-keys '~'
bind-key s send-keys '$' 
bind-key q send-keys '|'
bind-key + send-keys '^'
bind-key k send-keys '`'
bind-key ( send-keys <
bind-key ) send-keys >
bind-key C-a send-keys Escape
bind-key C-s send-keys '| less '
bind-key C-w send-keys 'lynks '
bind-key -r  Right  send-keys Tab

bind-key C source-file "$HOME/bin/tmux-scripts/celbind.tmux"  \; display "Cel bindings (Re)loaded!"

#choose-tree 
# vim: filetype=tmux : 
