#!/usr/bin/env sh
# Reference {

    # message-command-style style
    # Set status line message command style, where style is a comma-separated list of characteristics to be specified.

        # Macros {3
            #   Character pair    Replaced with
            #   #(shell-command)  First line of the command's output
            #   #[attributes]     Colour or attribute change
            #   #H                Hostname of local host
            #   #h                Hostname of local host without the domain name
            #   #F                Current window flag
            #   #I                Current window index
            #   #P                Current pane index
            #   #S                Session name
            #   #T                Current window title
            #   #W                Current window name
            #   ##		          A literal `#'
        # }
        # Colour {3
            # These may be 
            # 'bg=colour' to set the background colour, 
            # 'fg=colour' to set the foreground colour, and a list of attributes as specified below.
            #
            # The colour is one of: black, red, green, yellow, blue, magenta, cyan, white, aixterm bright variants (if supported: brightred, brightgreen,
            # and so on), colour0 to colour255 from the 256-colour set, default, or a hexadecimal RGB string such as '#ffffff', which chooses the closest
            # match from the default 256-colour set.
            #
            # The attributes is either none or a comma-delimited list of one or more of: bright (or bold), dim, underscore, blink, reverse, hidden, or
            # italics, to turn an attribute on, or an attribute prefixed with `no' to turn one off.
            #
            # Examples are:
            # fg=yellow,bold,underscore,blink
            # bg=black,fg=default,noreverse
            #
            # With the -a flag to the set-option command the new style is added otherwise the existing style is replaced.
            # }
            # Conditionals {
            # #{?session_attached,attached,not attached} Session_attached=1, val1, val2
            # #{=10:pane_title} pane_title=constantinopla =10:panet_title=constantin
            #                                                             1234567890<
        #}
        # The following variables are available, where appropriate: {

        # Alternate {
            # Variable name          ! Alias ! Replaced with
            # alternate_on           !       ! If pane is in alternate screen
            # alternate_saved_x      !       ! Saved cursor X in alternate screen
            # alternate_saved_y      !       ! Saved cursor Y in alternate screen
        #}
        # Buffer {
            # Variable name          ! Alias ! Replaced with
            # buffer_sample          !       ! First 50 characters from buffer
            # buffer_size            !       ! Size of the specified buffer in bytes
        #}
        # Client {
            # Variable name          ! Alias ! Replaced with
            # client_activity        !       ! Integer time client last had activity
            # client_activity_string !       ! String time client last had activity
            # client_created         !       ! Integer time client created
            # client_created_string  !       ! String time client created
            # client_height          !       ! Height of client
            # client_last_session    !       ! Name of the client's last session
            # client_prefix          !       ! 1 if prefix key has been pressed
            # client_readonly        !       ! 1 if client is readonly
            # client_session         !       ! Name of the client's session
            # client_termname        !       ! Terminal name of client
            # client_tty             !       ! Pseudo terminal of client
            # client_utf8            !       ! 1 if client supports utf8
            # client_width           !       ! Width of client
        #}
        # Cursor {
            # Variable name          ! Alias ! Replaced with
            # cursor_flag            !       ! Pane cursor flag
            # cursor_x               !       ! Cursor X position in pane
            # cursor_y               !       ! Cursor Y position in pane
        #}
        # History {
            # Variable name          ! Alias ! Replaced with
            # history_bytes          !       ! Number of bytes in window history
            # history_limit          !       ! Maximum window history lines
            # history_size           !       ! Size of history in bytes
        #}
        # Host, insert, keupad, line {
            # Variable name          ! Alias ! Replaced with
            # host                   ! #H    ! Hostname of local host
            # host_short             ! #h    ! Hostname of local host (no domain name)
            # insert_flag            !       ! Pane insert flag
            # keypad_cursor_flag     !       ! Pane keypad cursor flag
            # keypad_flag            !       ! Pane keypad flag
            # line                   !       ! Line number in the list
        #}
        # Mouse {
            # mouse_any_flag         !       ! Pane mouse any flag
            # mouse_button_flag      !       ! Pane mouse button flag
            # mouse_standard_flag    !       ! Pane mouse standard flag
            # mouse_utf8_flag        !       ! Pane mouse UTF-8 flag
        #}
        # Pane {
            # Variable name          ! Alias ! Replaced with
            # pane_active            !       ! 1 if active pane
            # pane_current_command   !       ! Current command if available
            # pane_current_path      !       ! Current path if available
            # pane_dead              !       ! 1 if pane is dead
            # pane_height            !       ! Height of pane
            # pane_id                ! #D    ! Unique pane ID
            # pane_in_mode           !       ! If pane is in a mode
            # pane_synchronized      !       ! If pane is synchronized
            # pane_index             ! #P    ! Index of pane
            # pane_pid               !       ! PID of first process in pane
            # pane_start_command     !       ! Command pane started with
            # pane_start_path        !       ! Path pane started with
            # pane_tabs              !       ! Pane tab positions
            # pane_title             ! #T    ! Title of pane
            # pane_tty               !       ! Pseudo terminal of pane
            # pane_width             !       ! Width of pane
        #}
        # Cursor, Scroll {
            # Variable name          ! Alias ! Replaced with
            # saved_cursor_x         !       ! Saved cursor X in pane
            # saved_cursor_y         !       ! Saved cursor Y in pane
            # scroll_region_lower    !       ! Bottom of scroll region in pane
            # scroll_region_upper    !       ! Top of scroll region in pane
        # }
        # Session {
            # Variable name          ! Alias ! Replaced with
            # session_attached       !       ! 1 if session attached
            # session_created        !       ! Integer time session created
            # session_created_string !       ! String time session created
            # session_group          !       ! Number of session group
            # session_grouped        !       ! 1 if session in a group
            # session_height         !       ! Height of session
            # session_id             !       ! Unique session ID
            # session_name           ! #S    ! Name of session
            # session_width          !       ! Width of session
            # session_windows        !       ! Number of windows in session
        #}
         # Window: {
            # Variable name          ! Alias ! Replaced with
            # window_active          !       ! 1 if window active
            # window_activity_flag   !       ! 1 if window has activity alert
            # window_bell_flag       !       ! 1 if window has bell
            # window_content_flag    !       ! 1 if window has content alert
            # window_find_matches    !       ! Matched data from the find-window
            # window_flags           ! #F    ! Window flags
            # window_height          !       ! Height of window
            # window_id              !       ! Unique window ID
            # window_index           ! #I    ! Index of window
            # window_layout          !       ! Window layout description
            # window_name            ! #W    ! Name of window
            # window_panes           !       ! Number of panes in window
            # window_silence_flag    !       ! 1 if window has silence alert
            # window_width           !       ! Width of window
        #}
        # wrap_flag              !       ! Pane wrap flag
     #}
# tmuxline config source: {3
#
# /
# " enable/disable usage of powerline symbols for separators (default on) 
#   g:tmuxline_powerline_separators = 0

# " configure the preset used in the statusline. Can be a "string" holding the
#   " name of the preset, or a hash {} holding fine-tuned configuration. The hash
#   " can hold keys 'a,b,c' to configure the left part of the statusline, 'x,y,z'
#   " to configure the right part, and 'win,cwin' to configure the contents of the
#   " inactive and active window(s). tmux options and be configured using a hash
#   " in 'options', window options can be specified with 'win_options' 

# " stock preset
#   let g:tmuxline_preset = 'nightly_fox'

# " custom preset with left-justified window list
#   let g:tmuxline_preset = {
#       \'a'       : '#S',
#       \'b'       : '#W',
#       \'c'       : '#H',
#       \'win'     : '#I #W',
#       \'cwin'    : '#I #W',
#       \'x'       : '%a',
#       \'y'       : '#W %R',
#       \'z'       : '#H',
#       \'options' : {'status-justify' : 'left'}}

# " custom preset with shell commands
#  let g:tmuxline_preset = {
#       \'a'    : '#S',
#       \'c'    : ['#(whoami)', '#(uptime  | cut -d " " -f 1,2,3)'],
#       \'win'  : ['#I', '#W'],
#       \'cwin' : ['#I', '#W', '#F'],
#       \'x'    : '#(date)',
#       \'y'    : ['%R', '%a', '%Y'],
#       \'z'    : '#H'}

# " configure which stock theme should be used by |:Tmuxline| 
#   let g:tmuxline_preset = 'nightly_fox'

# " fine-tune the separators 
#   let g:tmuxline_separators = {
#       \ 'left' : '',
#       \ 'left_alt': '>',
#       \ 'right' : '',
#       \ 'right_alt' : '<',
#       \ 'space' : ' '}

# " set theme 
#   tmuxline#api#set_theme({
#       \ 'a': ['237', '109', 'bold'],
#       \ 'b': ['109', '236', ''],
#       \ 'bg': ['240', '237', ''],
#       \ 'c': ['240', '237', ''],
#       \ 'cwin': ['109', '236', ''],
#       \ 'win': ['240', '237', ''],
#       \ 'x': ['240', '237', ''],
#       \ 'y': ['109', '236', ''],
#       \ 'z': ['237', '109', '']})

# " create a snapshot file of the last set statusline, overwriting the file if
# " it exists 
#   tmuxline#api#snapshot(path)

# " create a tmuxline theme from airline's pallette for a mode 
#   tmuxline#api#create_theme_from_airline(mode_palette)
# }

# This tmux statusbar config was created by tmuxline.vim
# on Wed, 04 Mar 2015
# reference }
tmux set-option -g message-bg "colour241"
tmux set-option -g message-command-bg "colour241"
tmux set-option -g message-command-fg "colour254"
tmux set-option -g message-fg "colour254"
tmux set-option -g pane-active-border-fg "colour125"
tmux set-option -g pane-border-fg "colour241"
tmux set-option -g status "on"
tmux set-option -g status-attr "none"
tmux set-option -g status-bg "colour235"
tmux set-option -g status-justify "left"
tmux set-option -g status-left-attr "none"
tmux set-option -g status-left-length "100"
tmux set-option -g status-right-attr "none"
tmux set-option -g status-right-length "100"
tmux set-option -g status-utf8 "on"


tmux set-window-option -g window-status-activity-attr "none"
tmux set-window-option -g window-status-activity-bg "colour235"
tmux set-window-option -g window-status-activity-fg "colour125"
tmux set-window-option -g window-status-attr "none"
tmux set-window-option -g window-status-bg "colour235"
tmux set-window-option -g window-status-fg "colour240"
tmux set-window-option -g window-status-separator ""


tmux set-option -g status-left "#[fg=colour230,bg=colour125,bold] #S:#I.#P•#W #[fg=colour125,bg=colour241,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour241] #{?client_prefix,⬆,•} #{?client_readonly,RO,•} #{?alternate_on,ALT,•} #[fg=colour241,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour240,bg=colour235] #(echo $PWD) #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]"
tmux set-option -g status-right "#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour240,bg=colour235] #(client_activity_string) #[fg=colour241,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour241] %R #[fg=colour125,bg=colour241,nobold,nounderscore,noitalics]#[fg=colour230,bg=colour125] #h "
tmux set-window-option -g window-status-format "#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[default] #F#I•#W #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]"
tmux set-window-option -g window-status-current-format "#[fg=colour235,bg=colour241,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour241] #F#I•#W #[fg=colour241,bg=colour235,nobold,nounderscore,noitalics]"
# vim: ft=sh.tmux foldmethod=marker foldmarker={,} foldlevel=1 foldenable :
