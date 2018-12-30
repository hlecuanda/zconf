#!/bin/zsh
#
#                   _   _                    _ _
#                  | |_(_)_ __ ___   ___  __| | | ___   __ _
#                  | __| | '_ ` _ \ / _ \/ _` | |/ _ \ / _` |
#                  | |_| | | | | | |  __/ (_| | | (_) | (_| |
#                   \__|_|_| |_| |_|\___|\__,_|_|\___/ \__, |
#                                                      |___/
# .............................................................................
# Exit values:
# 0 - normal execution
# 1 - normal execution, no change in logs
# 2 - no input log specified
# 3 - timewarp condition
logsize=$(mktemp)
log=${1}

function numlines () {
    file=${1}
    wc -l ${1}    |
    cut -f1 -d' '
}

if [[ ! -f ${log} ]]; then
    echo "Fascinating. What is this \"${log}\" you speak of?..."
    exit 2
fi

timedlog="timed-${log}"
if [[ -f .logsize ]]; then
    oldsize=$(cat ${logsize})
fi

numlines  ${log} >! ${logsize}
newsize=$(cat ${logsize})

if (( ${newsize} = ${oldsize} )) ; then
    exit 1
elif (( ${newsize} > ${oldsize} )) ; then
    newlines = ((${newsize} - ${oldize}))
    for each logline in $(head -${newlines} ${log}) ;
    do
        echo ${time}:${logline} >>! ${timedlog}
    done
else 
    exit 3
fi 

#  vim: set ft=zsh sw=4 tw=0 fdm=syntax et :
