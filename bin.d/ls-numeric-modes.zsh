#!/usr/bin/env zsh
tmpfil=/tmp/.testf

touch $tmpfil
for mode in {000..777}; do
  chmod $mode $tmpfil 2&> /dev/null
  [[ $? == "0" ]] && \
	print -Pf "%5s : %s\n" "%F{green}$mode%f" "%F{blue}$(ls -l $tmpfil|cut -c1-10)%f"
done
rm -f $tmpfil
#
#  vim: set ft=zsh sw=2 tw=0 fdm=manual noet :
