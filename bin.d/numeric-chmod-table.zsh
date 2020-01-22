#!/usr/bin/env zsh
# local usage="${0:t}\n\nusage:\n\t${0:t} -h :print this help\n\t${0:t} -c :colored output"
while getopts ":hc" x
do
  case $f in
	*|h) cat <<- EOF ; exit 1 ;;

		${0:t}:
		     print a numeric mode table with corresponding symbolic repr
		     v.gr: 777: -rwxrwxrwx

		usage:
		     ${0:t} [options]

		options:
		     -h	- print this help
		     -c	- colorized output

		EOF
	c) colorize=1 ;;
  esac
done
tmpfil=.testf
touch $tmpfil
for mode in {000..777}; do
  chmod $mode $tmpfil &>> /dev/null
  [[ $? -eq 0 ]] \
	&& (( $+colorize )) \
		&& print -Pf "%5s : %s\n" "%F{green}$mode%f" "%F{blue}$(ls -l $tmpfil|cut -c1-10)%f" \
		|| print  -f "%5s : %s\n" "$mode" "$(ls -l $tmpfil|cut -c1-10)" \
	|| :
done
rm -f $tmpfil
#
#  vim: set ft=zsh sw=2 tw=0 fdm=manual noet :
