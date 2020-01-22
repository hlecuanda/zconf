#!/usr/bin/env zsh
#
    ESCAPED_PATHNAME=$1 # %F
    ESCAPED_NAME=$2     # %N
    W=$3                # %w
    H=$4                # %h
    FORMAT=$5           # %t
    PIXELS=$6           # %P
    OFFSET=$7           # %o
    NOW=$(date +%Y%m%d-%H%M%S)
    LOGFILE="~/Pictures/.piclog"
    PIXFILE="~/Pictures/.allpix"

    cat ${PIXFILE:P} |grep -v $ESCAPED_PATHNAME > ${PIXFILE:P}.filt \
        && { cp -f ${PIXFILE:P} ${PIXFILE:P}.bak && mv -f ${PIXFILE:P}.filt ${PIXFILE:P} || exit 2 } \
        || echo "${NOW} : ERROR : feh-filter ${(Q)ESCAPED_NAME}" >>! ${LOGFILE:P}
    echo "${NOW} : FILTERED : ${(Q)ESCAPED_NAME}" >>! ${LOGFILE:P}



