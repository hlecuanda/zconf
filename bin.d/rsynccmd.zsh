#!/usr/bin/env zsh
#                                              _
#  _ __ ___ _   _ _ __   ___ ___ _ __ ___   __| |
# | '__/ __| | | | '_ \ / __/ __| '_ ` _ \ / _` |
# | |  \__ \ |_| | | | | (_| (__| | | | | | (_| |
# |_|  |___/\__, |_| |_|\___\___|_| |_| |_|\__,_|
#           |___/
# upd: h@h-lo.me 20180217 212147 -0800 PST 1518931307 d(-_- )b
# rsync with the usual trimmings, since 2018...
if [[ ${+commands[rsync]} ]]; then
  rsync=$(which rsync)
  $rsync -a                          \
         -i                          \
         -h                          \
         -P                          \
         -H                          \
         -E                          \
         -D                          \
         -S                          \
         --del                       \
         --force                     \
         --partial                   \
         $*
else
  print -P "%Brsync%b not installed"
  exit 1
fi
exit 0
#  vim: set ft=zsh sw=8 tw=0 fdm=manual et :
