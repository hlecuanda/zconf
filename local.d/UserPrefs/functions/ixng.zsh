#!/usr/bin/env zsh
#  _        _
# (_)_  __ (_) ___
# | \ \/ / | |/ _ \
# | |>  < _| | (_) |
# |_/_/\_(_)_|\___/
# h@h-lo.me 20190927 144132 -0700 PDT 1569620492 d(-_- )b...
# Zsh implementation of the ix.io pastebin client. Now does more shit
# than the bash version ftw!
#
local opts
local OPTIND
setopt localoptions shwordsplit
[[ -f "$HOME/.netrc" ]] && opts='-n'
(( $+commands[w3m] )) && alias w="$(which w3m)" || alias w='cat -'
while getopts ":hlo:d:i:n:u:" x; do
  case $x in
    d) curl $opts -X DELETE ix.io/$OPTARG; return;;
    i) opts="$opts -X PUT" ; local id="$OPTARG";;
    n) opts="$opts -F read:1=$OPTARG";;
    o) curl $opts -o -X GET ix.io/$OPTARG; return;;
    l) w ix.io/user/  ; return;;
    u) w ix.io/user/$OPTARG ; return;;
  h|*) cat <<- EOF ; return ;;
		usage:
		  ix hello.txt              # paste file (name/ext will be set).
		  echo Hello world. | ix    # read from STDIN (won't set name/ext).
		  ix -n 1 self_destruct.txt # paste will be deleted after one read.
		  ix -i ID hello.txt        # replace ID, if you have permission.
		  ix -o ID                  # print contents of ID  as output
		  ix -d ID                  # delete ID, if you have permission.
		  ix -u USER                # list pastes for USER
		  ix -l                     # list the last 100 pastes
		EOF
  esac
done
shift $(($OPTIND - 1))
[[ -t 0 ]] && {
  local filename="$1"
  shift
  [[ -n "$filename" ]] && {
    curl $opts -F f:1=@"$filename" $* ix.io/$id
    return
  }
  echo "^C to cancel, ^D to send."
}
curl ${(Q)opts} -F f:1='<-' $* ix.io/$id
[[ -o verbose ]] && unsetopt verbose xtrace sourcetrace || :
#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
