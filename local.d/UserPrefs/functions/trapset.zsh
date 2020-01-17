#!/usr/bin/env zsh
#  _                            _
# | |_ _ __ __ _ _ __  ___  ___| |_
# | __| '__/ _` | '_ \/ __|/ _ \ __|
# | |_| | | (_| | |_) \__ \  __/ |_
#  \__|_|  \__,_| .__/|___/\___|\__|
#               |_|
# #
# h@h-lo.me 20200109 000437 -0800 PST 1578557077 d(-_- )b...
# An autoloadable function that sets  or unsets traps

[[ $0 == "trapset" ]] || { trapunset "TRAP$NAL"; return 0 }

function trapunset () {
  local -a funcs
  local sel signals=$(kill -l)
  : ${(M)functions:#TRAP$NAL}
  : ${funcs:=${(k)functions}}
}

#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
