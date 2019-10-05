# vim: ft=tmux foldmarker={,} foldmethod=marker foldlevel=2 foldenable :

# Reference/*{*/
# Pallete/*{*/
# SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      sRGB        HSB
# --------- ------- ---- -------  ----------- ---------- ----------- -----------
# base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
# base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
# base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
# base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
# base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
# base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
# base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
# base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
# yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
# orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
# red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
# magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
# violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
# blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
# cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
# green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
#/*}*/
# From the tmux man page/*{*/
#
# These may be `bg=colour' to set the background colour, `fg=colour' to set the foreground colour, and a list of attributes as specified below.
#
# The colour is one of: black, red, green, yellow, blue, magenta, cyan, white, aixterm bright variants (if supported: brightred, brightgreen, and so on), colour0 to
# colour255 from the 256-colour set, default, or a hexadecimal RGB string such as `#ffffff', which chooses the closest match from the default 256-colour set.
#
# The attributes is either none or a comma-delimited list of one or more of: bright (or bold), dim, underscore, blink, reverse, hidden, or italics, to turn an attribute
# on, or an attribute prefixed with `no' to turn one off.
#
#
# With the -a flag to the set-option command the new style is added otherwise the existing style is replaced.
# /*}*/
# Examples are:/*{*/
#    fg=yellow,bold,underscore,blink
#    bg=black,fg=default,noreverse
# # #[fg=XXX,bg=XXX,xxx]/*}*/
#/*}*/

# Status Bar/*{*/
# default statusbar colors {2
set-option -g status-bg brightmagenta #base03
set-option -g status-fg white
# set-option -g status-attr default
set -g status-right-bg black
set -g status-right-fg white
set -g status-left-bg black
set -g status-left-fg white

# default window title colors {2
set-window-option -g window-status-fg white  #base0
set-window-option -g window-status-bg brightmagenta
#set-window-option -g window-status-attr dim

# active window title colors {2
set-window-option -g window-status-current-fg brightmagenta #orange
set-window-option -g window-status-current-bg white
# set-window-option -g window-status-current-attr bright
#}
# /*}*/

# Alerts/*{*/
# Window with bell {2
set-window-option -g window-status-bell-fg   brightred
set-window-option -g window-status-bell-bg   white
set-window-option -g window-status-bell-attr default

# # Window with content alert {2
# set-window-option -g window-status-content-fg   brightred
# set-window-option -g window-status-content-bg   white
# set-window-option -g window-status-content-attr default

# Window with activity alert {2
set-window-option -g window-status-activity-fg   brightred
set-window-option -g window-status-activity-bg   white
set-window-option -g window-status-activity-attr default

# message text {2
set -g message-attr bold
set -g message-fg colour16
set -g message-bg colour220
#}
# }*/

# Pane Styles /*{*/
# pane border {2
set-option -g pane-border-fg brightblack #base02
set-option -g pane-active-border-fg brightblack #base01

# pane number display {2
set-option -g display-panes-active-colour brightblack #blue
set-option -g display-panes-colour brightred #orange

# clock {2
set-window-option -g clock-mode-colour brightblack #green
#}
#/*}*/
