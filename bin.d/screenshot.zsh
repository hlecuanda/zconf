#!/usr/bin/env zsh
#                                   _           _
#  ___  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_
# / __|/ __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __|
# \__ \ (__| | |  __/  __/ | | \__ \ | | | (_) | |_
# |___/\___|_|  \___|\___|_| |_|___/_| |_|\___/ \__|
# h@h-lo.me 20190922 181554 -0700 PDT 1569201354 d(-_- )b...
#
#  Takes a screenshot using scrot, then shows onscreen using feh
#  requiresÑ
#  scrot
#  feh
#
(( ${+commands[scrot]} )) || { print missing scrot; exit 1 }
(( ${+commands[feh]} ))   || { print missing feh; exit 1 }

f="$(date '+%Y%m%d-%H%M%S-%s').png"
scrot ${f} -e "mv ${f} ${HOME}/Pictures/Screenshots/" \
    && feh --quiet -Thlo "${HOME}/Pictures/Screenshots/${f}" 2&>/dev/null &  \
    || {print "Something went wrong!"; exit 1}

#  vim: set ft=zsh sw=4 tw=0 fdm=manual et :
