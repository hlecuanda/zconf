#!/usr/bin/env zsh
#            _                _     _
#   ___ ___ | | ___  _ __ ___| |__ (_)_ __  ___
#  / __/ _ \| |/ _ \| '__/ __| '_ \| | '_ \/ __|
# | (_| (_) | | (_) | | | (__| | | | | |_) \__ \
#  \___\___/|_|\___/|_|  \___|_| |_|_| .__/|___/
#                                    |_|
# h@h-lo.me 20180218 023821 -0800 PST 1518950301 d(-_- )b...
#
# print colorchips for the $FG $BG and $FX spectrum arrays
# if (( $+modules[zsh/zutil] == 0 )); then
#   zmodload zsh/zutil # needed for zparseopt
# fi

F=(black)
for f in ${(k)F}
do
  printf "\n%b %-40b %b\n" $FX[reverse]$FG[$f] "foreground is $f" $FG[none]$FX[none]
  for b in ${(nk)BG}
  do
    if (( $b % 8 != 0  )); then
      print -f "%b%b %3.3b%b%b" $BG[$b] $FG[$f] "$b" $FG[none] $BG[none]
    else
      print -f "%b%b %3.3b%b%b\n" $BG[$b] $FG[$f] "$b" $FG[none] $BG[none]
    fi
  done
done
#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
