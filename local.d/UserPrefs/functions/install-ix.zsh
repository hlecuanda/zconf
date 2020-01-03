#!/usr/bin/env zsh
#  _        _
# (_)_  __ (_) ___
# | \ \/ / | |/ _ \
# | |>  < _| | (_) |
# |_/_/\_(_)_|\___/
# zsh client implementation for the ix.io pastebin
# now it doers more shit than it's bash counterpart!
# h@h-lo.me 20191001 170833 -0700 PDT 1569974913 d(-_- )b...

function wdir () {
  setopt localoptions noxtrace noverbose nosourcetrace
  local    tdir="${argv[1]:P}"
  [[ ! -d "${tdir}" ]] && exit 1
  local -i mode=$(zstat -o +mode "${tdir}" | cut -c4- )
  local    uuid=$(whoami)
  local    fuid=$(zstat -s -T +uid "${tdir}")
  local    fgid=$(zstat -s -T +gid "${tdir}")
  local -a ugid
  ugid=( $(groups $uuid) )
  (( ( $mode & 200 ) == 0 )) &&  wr=1 || :
  (( ( $mode & 020 ) == 0 )) & [[ ! -z "${fgid:*ugid}" ]] &&  wr=1 || :
  (( ( $mode & 002 ) == 0 )) & [[ "$fuid" == "$uuid" ]] &&  wr=1 || :
  (( $+wr )) && echo "${tdir}" || exit 1
}

function choosedir () {
  local doecho=$argv[1]
  local PROMPT3="Install Dir:>"
  print "Choose a directory to install the ix.io client"
  print "these are writable directories found in your fpath:"
  print "---"
  select target in $wdirs
    ${doecho} cp ix "${target:P}"; break;
  autoload ix
  "${ZDOTDIR:-HOME}/.zshrc" !<<- EOF
	# === ix.io client ===
	autoload ix
	# === ix.io client ===
	EOF
}

function addfpathdir () {
  local doecho=$argv[1]
  local newdir="${ZDOTDIR:-HOME}/.ixio"
  mkdir -p "${newdir:a}"
  cp ix ${newdir:a}
  fpath = ($fpath "${newdir:a}")
  autoload ix
  "${ZDOTDIR:-HOME}/.zshrc" !<<- EOF
	# === ix.io client ===
	fpath=(\$fpath "${ZDOTDIR:-HOME}/ix")
	autoload ix
	# === ix.io client ===
	EOF
}

function main () {
  local doecho=$argv[1]
  zmodload -F zsh/stat b:zstat
  typeset -Ua wdirs
  for d in $fpath
    wdirs=($wdirs $(wdir "$d"))
  [[ ${#wdirs} -ne 0 ]] && choosedir ${doecho} || addfpathdir
}

while getopts ":xhd" opt ; do
  case $opt in
    x) pcm="setopt xtrace sourcetrace verbose" && eval "$pcm" ;;
    d) fpr="echo" ;;
  *|h) cat <<- EOL ; break ;;
	${0:r}:
	   install the ix.io client

	usage:
	  ix-install [options]

	options:
	  -h : print thia hwlp
	  -x : debug with xtrace
	  -d : dry run
	EOL
  esac
done

eval "{ main ${fpr} }"

(( $+pcm )) && eval "un${pcm}"

#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
