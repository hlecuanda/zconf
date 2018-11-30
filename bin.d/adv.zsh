#!/usr/bin/env zsh
#            _
#   __ _  __| |_   __
#  / _` |/ _` \ \ / /
# | (_| | (_| |\ V /
#  \__,_|\__,_| \_/
# h@h-lo.me 20180217 213547 -0800 PST 1518932147 d(-_- )b...
# Monitor dir file count and size, for use with rsynccmd
typeset DFLT=2
while true;
do
  echo $(date):\
       $(ls -lh ${1:-$CWD} | cut -f5 -d' '):\
       $(echo $(df .) | cut -f12 -d' ')
  sleep ${2:-$DFLT}
done
