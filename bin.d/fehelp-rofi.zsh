#!/usr/bin/env zsh
cat .config/feh/keys.rofi              \
  | awk '/^\w/ {print $0}'             \
  | tr -s \                            \
  | awk '{printf "%12s %s\n",$2,$1}'   \
  | rofi -dmenu -p BIND -mesg "find feh keybinding help here" \
         -normal-window -sync -location 1 -theme DarkBlue
