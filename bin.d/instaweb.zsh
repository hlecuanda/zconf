#!/usr/bin/env zsh
#
#  _           _                     _
# (_)_ __  ___| |_ __ ___      _____| |__
# | | '_ \/ __| __/ _` \ \ /\ / / _ \ '_ \
# | | | | \__ \ || (_| |\ V  V /  __/ |_) |
# |_|_| |_|___/\__\__,_| \_/\_/ \___|_.__/
#
# Instant webserver om $(PWD), regardless of system python version
#
# h@h-lo.me 20200119 182435 -0800 PST 1579487075 d(-_- )b...
#
setopt localtraps

  trap '
  local logfmt="%s (%d): %s"
  print -P  ${(%)f:=%N} ${(%)l:=%I} ${ZSH_DEBUG_CMD} | read sourcef lineno cmdsrc
  [[ $sourcef == "0" ]] && sourcef="while sourcing"
  print -f "$logfmt" $sourcef $lineno $cmdsrc | read logline
  zlog -t $0 $logline
  ' DEBUG

  trap '
  trap - DEBUG
  print -P  ${(%)f:=%N} ${(%)l:=%I} ${ZSH_DEBUG_CMD} | read sourcef lineno cmdsrc
  [[ $sourcef == "0" ]] && sourcef="while sourcing"
  print -f "$logfmt" $sourcef $lineno $cmdsrc | read logline
  zlog -t $0 -s err "E: $logline"
  ' ERR

zparseopts -D -A opts -- p: d:

local pyver=$( python -V 2>&1 )
local module

(( $+opts[-d] )) && cd "${opts[-d]:A}"
[[ $pyver < "3.0" ]] && module="http.server" || module="SimpleHTTPServer"

python -m $module $opts[-p] &>! /dev/null &!
# trap - DEBUG
#  d(-_-;)bm  hlo.mx 1579487040
#  vim:  et :
