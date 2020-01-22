#!/usr/bin/env zsh

  # use the following line for logging to avoid infinite recursion
  # logger -t zlog --id=$$ -p user.warning --

  function printhelp {

    # this function just prints the usage- note the leading
    # tabs on the text body, they will be removed when dumping
    # the content on stdout because the here-doc is using the
    # <<- operataor (as opposedto <<). this will not remove
    # leading spaces, only leading tabs, so re-tabbing this
    # file for leading spaces will cause formatting to be lost

    cat <<- EOH
		${1}: automate logging

		   This shell function will log to syslog automating
		   some of the most tedious stuff.   By default it uses
		   facility 'user.info' with a tag of zlog. If logging
		   an array variable  it will serializeit  into strings
		   as if printed using \${(V)array[*]:q} notation.
		   Associative arrays are printed wth
		   \${(kvV)assoc[*]:q}, which will render key value
		   pairs in consecutive words in the resulting sring,
		   v.gr: (key1 value1 key2 value2 ..) The rest of the
		   applied expansion flags in all cases will nicely
		   quote the resulting string, plus the (V) flag will
		   render invisible any control charactears in a
		   textual form, to prevent corrupting your terminl for
		   example when for some reason the value of $terminfo
		   or similar variables gets logged

		USAGE
		    ${1} [options] -- ["message payload"] [params]

		OPTIONS
		   -f [FAC], --facility [FAC]  : log to facility
		                                 (default: user)
		   -s [SEV], --severity [SEV]  : log with severity
		                                 severity (default: info)
		   -t [TAG], --tag=t [TAG]     : set tag id for the
		                                 generated log,
		                                 (default: "log")
		   -h, --help                  : print this message and
		                                 exit

		h@h-lo.me 20191016 122515 -0700 PDT 1571253915 d(-_- )b...
		EOH

           # -p [NAM], --parameter [NAM] : log the name and value
           #                               of parameter named NAM
    return
  }


  function unrollargs () {

    # if argument is an rray or dictionary, this function wuill
    # it will "unpack" it so the wholevalue gets serialized as
    # it should the bit ${(t)a:1:5} prints chars 1.5 of the
    # type string for the "a" parameter, revealed by using the
    # (t)ype expansion flag."

    local a
    for a in $argv
    do
      case "${(t)a:1:5}" in
        array)
          print -f "var: ( %s )" "array" "${(vV)a:q}"
          ;;
        assoc)
          print -f "var: (%s) [ %s ]" "assoc" "${(kvV)a:q}"
          ;;
        *)
          print ${(V)a:q}
          ;;
      esac
    done
  }

  #main
  local -A opts
  opts[-t]="zlog"  # default values
  opts[-f]="user"  # for common options
  opts[-s]="info"
  local help

  zparseopts -D -E -M -K -A opts -- \
    f: -facility=f \
    s: -severity=s \
    t: -tag=t \
    h=hlp  -help=h

  if (( $+hlp )) ; then
    printhelp $0
  else
    local level="$opts[-f].$opts[-s]"
    logger -t $opts[-t] --id=$PPID -p $level -- $(unrollargs $*)
  fi

#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
