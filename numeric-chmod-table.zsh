#!/usr/bin/env zsh
tmpfil=$TMP/testf

touch $tmpfil
for mode in {757..750}; do
  chmod $mode $tmpfil
  print -Pf "%5s : %s\n" "%F{green}$mode%f" "%F{blue}$(ll t|cut -c1-10)%f"
done
rm -f $tmpfil
#
#  vim: set ft=zsh sw=2 tw=0 fdm=manual noet :
