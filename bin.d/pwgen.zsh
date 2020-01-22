#!/usr/bin/env zsh
[[ -n ${1} ]] && pwlen=${1} || pwlen=18
/usr/bin/pwgen -sy $pwlen | xclip -i -selection clipboard
echo "Secure password generated and on clipboar:d"
