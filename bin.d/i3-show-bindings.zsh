#!/usr/bin/env zsh
/bin/cat .config/i3/config                \
  | awk -- "/$1 start/ , /$1 end/ { print \$0 } " \
  | tr -s \  \
  | sed 's/+\s\+/+/' \
  | sed 's/,//' \
  | sed 's/--release//' \
  | sed 's/$alt/Alt/' \
  | sed 's/$ctl/Ctrl/' \
  | sed 's/\$mod/[MD]/' \
  | sed 's/\$hft/Shift/' \
  | awk '/bindsym/ && !/^#/ { printf "%15s : %s %s\n" , $2 , $3 , $4 }' \
  | rofi -dmenu
#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
