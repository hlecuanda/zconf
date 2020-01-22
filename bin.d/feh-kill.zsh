#!/usr/bin/env zsh


    ESCAPED_PATHNAME=$1 # %F
    ESCAPED_NAME=$2     # %N
    W=$3                # %w
    H=$4                # %h
    FORMAT=$5           # %t
    PIXELS=$6           # %P
    OFFSET=$7           # %o
    NOW=$(date +%Y%m%d-%H%M%S)
    LOGFILE="~/Pictures/.piclog"

    rm -f ${ESCAPED_PATHNAME}
    echo "${NOW} : DELETE : ${(Q)ESCAPED_NAME}" >>! ${LOGFILE:P}



