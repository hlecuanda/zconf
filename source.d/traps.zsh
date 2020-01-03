

# function TRAPZERR () {
# # trap ' {
#     local f location loc
#     [[ $0 != "${(%)f:=%x}" ]] && location="${(%)loc:-%I}"
#     zlog -t $0 "[ERR]:file:${(%)f:t} cmd:$nxtc $location:t"
#     unset  f location loc
# # } &>/dev/null ' ZERR
# }

# function TRAPINT () {
# # trap ' {
#     zlog "Caught SIGINT, aborting."
#     return $(( 128 + $1 ))
# # }' INT
# }

# function TRAPDEBUG () {
# # trap '{
#     unsetopt warn_create_global
#     local nxtc ZSH_DEBUG_CMD
#     test -v ${nxtc:=$ZSH_DEBUG_CMD} &>/dev/null
#     case $nxtc in
#         typese*|global*)
#         zlog -t $0 "${(%)f:=file %f:t} set:${(qqV)ZSH_DEBUG_CMD}"
#         ;;
#     source*)
#         zlog -t $0 "${(%)f:=file %f:t} src:${(qqV)ZSH_DEBUG_CMD}"
#         ;;
#     esac
# # } &> /dev/null ' DEBUG
#  }
