
    # Clipboard acces from TMUX X11!: {
        bind C-c run "tmux save-buffer - | xclip -i"
        bind C-v run "xclip -o | tmux load-buffer - && tmux paste-buffer"
#        bind -t vi-copy Y copy-pipe "xclip -i"
#        bind -t vi-copy y copy-pipe "xclip -i"
#        bind -t vi-copy v begin-selection
#        bind -t vi-copy V begin-selection
    # End }
    # # Clipboard acces from TMUX Mac!: {
#         # Requires brew install reattach-to-user-namespace
#         # http://robots.thoughtbot.com/post/55885045171/tmux-copy-paste-on-os-x-a-better-future
    #     bind C-c run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
    #     bind C-v run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"
    #     bind -t vi-copy Y copy-pipe "reattach-to-user-namespace pbcopy"
    #     bind -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
    #     bind -t vi-copy v begin-selection
    #     bind -t vi-copy V begin-selection
    # # End }
    # Custom Commands and Scripts: {
        #TODO: Fix with new option set-remain-on-exit
        # bind C-R set-window-option remain-on-exit \; kill-pane \; respawn-pane \; set-window-option remain-on-exit off \; display-message "Pane #I:#P Recycled...."
        # bind M-r set-window-option remain-on-exit \; kill-pane \; respawn-pane \; set-window-option remain-on-exit off \; display-message "Pane #I:#P Recycled...."
    # End }
