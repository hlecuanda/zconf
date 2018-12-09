#!/usr/bin/env tcsh -f
#        _ _        _
#   __ _(_) |_     | |__
#  / _` | | __|____| '_ \
# | (_| | | ||_____| |_) |
#  \__, |_|\__|    |_.__/
#  |___/
# For use as precmd in tcsh prompt
# 2012-11-08 10:59:58

git branch >& /dev/null
if ( $? ) then
   echo `git branch | grep \* | sed s/\*\ //`
else
   echo 'N/A'
endif

