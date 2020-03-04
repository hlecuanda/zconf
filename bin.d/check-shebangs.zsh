#!/usr/bin/env zsh
#
#       _               _             _          _
#   ___| |__   ___  ___| | __     ___| |__   ___| |__   __ _ _ __   __ _ ___
#  / __| '_ \ / _ \/ __| |/ /____/ __| '_ \ / _ \ '_ \ / _` | '_ \ / _` / __|
# | (__| | | |  __/ (__|   <_____\__ \ | | |  __/ |_) | (_| | | | | (_| \__ \
#  \___|_| |_|\___|\___|_|\_\    |___/_| |_|\___|_.__/ \__,_|_| |_|\__, |___/
#                                                                  |___/
# h@h-lo.me 20200303 194729 -0800 PST 1583293649 d(-_- )b...
# Prints a columnar table of files in the directory specified, nd
# their respective shebanhs (or whatever the content of their first
# line is)
#
# TODO: zparseopts
# TODO: helpscript

() {
  paste -d : <( cat $1 | sed -nEe '1~2p' ) \
             <( cat $1 |sed -nEe '0~2p') \
    | awk -F : '{ printf "%s:%s\n", $1, $2}'
} =( head -1 *  \
       | tr -d '=><' \
       | sed -Ee 's/^\s//' \
       | awk '!/^$/' )

#  d(-_-;)bm  hlo.mx 1583293504
#  vim:  et :
