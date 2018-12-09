# vim: ft=tmux foldmethod=marker foldmarker={,} foldenable foldlevel=1 foldminlines=3 :
# This tmux statusbar config was created by tmuxline.vim
# on Wed, 04 Mar 2015
#
# tmuxline config source¨:
# {2
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

set -g status-bg "colour235"
set -g message-command-fg "colour254"
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g pane-active-border-fg "colour125"
set -g message-bg "colour241"
set -g status-right-length "100"
set -g status-right-attr "none"
set -g message-fg "colour254"
set -g message-command-bg "colour241"
set -g status-attr "none"
set -g status-utf8 "on"
set -g pane-border-fg "colour241"
set -g status-left-attr "none"
setw -g window-status-fg "colour240"
setw -g window-status-attr "none"
setw -g window-status-activity-bg "colour235"
setw -g window-status-activity-attr "none"
setw -g window-status-activity-fg "colour125"
setw -g window-status-separator ""
setw -g window-status-bg "colour235"
set -g status-left "#[fg=colour230,bg=colour125,bold] #S:#I.#P•#W #[fg=colour125,bg=colour241,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour241] #{?client_prefix,⬆,•} #{?client_readonly,RO,•} #{?alternate_on,ALT,•} #[fg=colour241,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour240,bg=colour235] #(echo $PWD) #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour240,bg=colour235] #(client_activity_string) #[fg=colour241,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour241] %R #[fg=colour125,bg=colour241,nobold,nounderscore,noitalics]#[fg=colour230,bg=colour125] #h "
setw -g window-status-format "#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[default] #F#I•#W #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=colour235,bg=colour241,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour241] #F#I•#W #[fg=colour241,bg=colour235,nobold,nounderscore,noitalics]"
