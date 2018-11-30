#!/usr/bin/env zsh

i3config="${HOME}/.config/i3/config"

function get_binding_modes () {
  cat ${i3config} |
  mawk --  '/^.mode/ { print $2 }' 
}

function main_menu () {
  get_binding_modes | rofi -dmenu
}

function mode_menu () {
    local FS=","
    # echo "FS ${(q)FS}"
    mode=${1}
    echo "mode=${1}"
    echo "mawk -f =(echo "/^.mode ${1}/ { print }") "
    cat ${i3config} |
    mawk -f =($(echo "/^.mode ${1}/ { print }")) |
    grep -vEe ^\#   |
    grep -vEe ^\ +\#   |
    # mawk -- "/^.mode ${1} \{/,/^.}/ { print }" |
    grep -vEe \{    |
    grep -vEe \}    |
    sed -re '/^$/d' |
    sed -re 's/\ +bindsym //' |
    sed -re 's/mode //' |
    sed -re 's/exec //' |
    sed -re 's/,\ +default//' |
    sed -re 's/\ +/,/ '  |
    # mawk -F , '{print $NF}'
    mawk -F , -- '{ printf("%10s -> %s\n", $1, $NF) }'
  }
    
# mode_menu $(main_menu) | rofi -dmenu
mode_menu $(main_menu) 
#
#
#  vim: set ft=zsh sw=2 tw=0 fdm=syntax et nolist :
