# vim: ft=tmux foldmarker={,} foldmethod=marker foldlevel=1 foldenable :
    # Prefix behavior like screen {
        unbind C-b
        set -g prefix  C-a
        set -g prefix2 C-b      # for purists
        bind      a send-prefix # Nested connection
        bind -n C-q send-prefix
    # }
    # Std commands remapped  {
        unbind  & # better safe than sorry

        bind    b set-option  status # toggle status bar
        bind    c new-window
        bind    C display "Client ops" \; switch-client -T client
        bind    f source-file ~/src/Dotfiles/dotfiles/tmux.d/kbd-fkeys-passport.tmux \; display-message "Passport Function Keys Loaded"
        bind    F source-file ~/src/Dotfiles/dotfiles/tmux.d/kbd-fkeys-reset.tmux \; display-message "Xterm Function Keys Loaded"
        bind    h previous-window
        bind    j select-window -t {start}
        bind    k select-window -t {end}
        # TODO: write script to do this in a more straightforward manner
        # bind    K command-prompt -p 'Man page to dislplay? : ' "split-window -h 'exec man %%'; send-keys C-p" # New window manpage
        bind    l next-window
        bind    L pipe-pane -o "cat >>~/session-logs/#W.log" \; display "Toggled logging to ~/#W.log" \; setenv TMUX_WINDOW_LOG '~/#W.log'
        bind    m display "Monitoring" \; switch-client -T monitor
        bind    M display "Monitoring" \; switch-client -T monitor
        bind    p paste-buffer  # case insensitive paste
        bind    P paste-buffer
        bind    r source-file $HOME/src/Dotfiles/dotfiles/tmux.d/tmux.conf \; display "Config Reloaded!"
        bind    R display "Resize" \; switch-client -T resize
        bind    s display "Sessions" \; switch-client -T monitor
        bind    v copy-mode # case insentitive  copy mode
        bind    V copy-mode
        bind    z resize-pane -Z # case insensitive zoom toggle
        bind    Z resize-pane -Z

        # bind   F1 
        bind   F2   choose-buffer
        bind   F3   choose-client
        bind   F4   choose-session
        bind   F5   choose-tree
        bind   F6   choose-window
        # bind   F7
        # bind   F8 
        # bind   F9 
        # bind   F10 
        # bind   F11 
        # bind   F12 

        # very vim bindings
        bind  `   copy-mode
        bind -r   <     resize-pane -L
        bind -r   >     resize-pane -R
        bind -r   -     resize-pane -D
        bind -r   +     resize-pane -U

        bind -r   Right select-pane -t {right-of}
        bind -r   Left  select-pane -t {left-of}
        bind -r   Up    select-pane -t {up-of}
        bind -r   Down  select-pane -t {down-of}

        bind    C-h     resize-pane -L 5
        bind    C-j     resize-pane -D 5
        bind    C-k     resize-pane -U 5
        bind    C-l     resize-pane -R 5
        bind -r C-R     rotate-window # case insensitive rotate
        bind -r C-r     rotate-window 
        bind -r C-Right select-pane -t {right}
        bind -r C-Left  select-pane -t {left}
        bind -r C-Up    select-pane -t {top}
        bind -r C-Down  select-pane -t {bottom}

        unbind  Space
        bind -r Space set repeat-time 3000 \; next-layout
        bind -r Tab   select-window -t {next}
        bind -r BTab  select-window -t {previous}

        bind    | split-window -h
        bind    - split-window -v
        bind    / command-prompt "find-window '%%'"

        bind -T resize    ?       list-keys -T resize
        bind -T resize -r <       resize-pane -L
        bind -T resize -r >       resize-pane -R
        bind -T resize -r -       resize-pane -D
        bind -T resize -r +       resize-pane -U
        bind -T resize -r Left    resize-pane -L
        bind -T resize -r Right   resize-pane -R
        bind -T resize -r Down    resize-pane -D
        bind -T resize -r Up      resize-pane -U
        bind -T resize -r C-Left  resize-pane -L 5
        bind -T resize -r C-Right resize-pane -R 5
        bind -T resize -r C-Down  resize-pane -D 5
        bind -T resize -r C-Up    resize-pane -U 5

        bind -T client    ?       list-keys -T client
        bind -T client    c       choose-client
        bind -T client    d       detach-client
        bind -T client    l       list-clients
        bind -T client    k       lock-client
        bind -T client    r       refresh-client
        bind -T client    s       suspend-client

        bind -T session    ?      list-keys -T session
        bind -T session    c      choose-session
        # TODO: ADD prompting
        # bind -t session Left  has-session
        bind -T session    K      kill-session
        bind -T session    k      list-sessions
        bind -T session    l      lock-session
        bind -T session    n      new-session
        # TODO: ADD prompting
        # bind -t session    r  rename-session
        bind -T session    Left   attach-session -d -c $HOME -t {next}
        bind -T session    Right  attach-session -d -c $HOME -t {previous}

        bind -T monitor    ?      list-keys -T monitor
        bind -T monitor    m      select-pane -m
        bind -T monitor    M      select-pane -m
        bind -T monitor    a      setw monitor-activity off
        bind -T monitor    A      setw monitor-activity on
        bind -T monitor    s      setw monitor-silence 0
        bind -T monitor    S      setw monitor-silence 15
    # End }
