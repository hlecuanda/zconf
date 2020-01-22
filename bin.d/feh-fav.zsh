#!/usr/bin/env zsh
#
    ESCAPED_PATHNAME=$1 # %F
    ESCAPED_NAME=$2     # %N
    W=$3                # %w
    H=$4                # %h
    FORMAT=$5           # %t
    PIXELS=$6           # %P
    OFFSET=$7           # %o
    FAV=$8              # LIT
    NOW=$(date +%Y%m%d-%H%M%S)
    LOGFILE="~/Pictures/.piclog"
    PIXFILE="~/Pictures/.allpix"
    FAVFOLDER="~/Pictures"


    [[ -d ${FAVFOLDER:P}/${FAV} ]] && true || mkdir -p ${FAVFOLDER:P}/${FAV}

    case ${(U)FAV} in
        'LIZ')
            ;&
        'DRL')
            ;&
        'BRN')
            ;&
        'MIA')
            echo cp -av ${ESCAPED_PATHNAME} ${FAVFOLDER}/${FAV}/${ESCAPED_NAME} | tee ~/fehlog
            cp -a ${ESCAPED_PATHNAME} ${FAVFOLDER}/${FAV}/${ESCAPED_NAME}
            ;;
        *)
            echo  cp -av $1 ${FAVFOLDER}/Fav/$2 | tee ~/fehlog
            cp -a $1 ${FAVFOLDER}/Fav/$2
            ;;
    esac

    echo "${NOW} : FAV : ${(Q)ESCAPED_NAME}" >>! ${LOGFILE:P}



