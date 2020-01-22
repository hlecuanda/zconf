
    # use the following line for logging to avoid infinite recursion
    # logger -t zlog --id=$$ -p user.warning --

    function printhelp {
        cat <<- EOH
		$0: automate logging

		   this shell function will log to syslog automating some
		   of the most tedious stuff.   By default it uses facility
		   'user.info' with a tag of zlog. If logging array it will
		   serialize them into strings as in \${(qqV)array[*]} and
		   when logging assocs it will unroll into alternating key
		   values as in \${(kvqq)assoc[*]}, thus ensuring that all
		   values, including unprintable terminal sequences are
		   rendered, thus avoiding the messing up of your terminal.
		   (v.gr you can unroll \$terminfo )

		USAGE
		      zlog [options] -- ["message payload"] [params]

		OPTIONS
		   -f, --facility   # override faciliti (defaults to user)
		   -s, --severity   # override severity (defaults to info)
		   -t, --tag=t      # set tag id for the generated log
		   -h, --help       # print this message and exit

		h@h-lo.me 20191016 122515 -0700 PDT 1571253915 d(-_- )b...
		EOH
        return
    }

    function unrollargs () {
        local a
        for a in $argv
        do
            case "${(t)a:1:5}" in
                array)
                    print -f "%s: (%s) ( %s )" $a ${(t)a} "${(vqqV)a}"
                    ;;
                assoc)
                    print -f "%s: (%s) [ %s ]" $a ${(t)a} "${(kvqqV)a}"
                    ;;
                *)
                    print -f "%s: %s" $argv
                    ;;
            esac
        done
    }

    #main
    local -A opts=( -t zlog -f user -s info )
    local help stor

    zparseopts -D -E -M -K -A opts -a stor -- \
        f: -facility=f \
        s: -severity=s \
        t: -tag=t \
        h=help  -help=h

    if (( $#help > 0 )) ; then
        printhelp
    else
        local level="$opts[-f].$opts[-s]"
        logger -t $opts[-t] --id=$$ -p $level --  $(unrollargs $*)
    fi

    unset help opts stor level

#  vim: set ft=zsh sw=4 tw=0 fdm=manual noet :
