#!/usr/bin/env zsh
function gettag () {
  tag="$(<&0)"
  val="$(exiftool -d %s -${tag} ${1:a} | cut -f2 -d: | tr -d \  )"
  ((  ${#val} > 1  )) && print -f "%s %s" "${tag}" "${val}" || :
  return
}

# for tag in ${(z)alltags:="$(exiftool -list)"}
#   (( ${#tag} >1  )) && {
#   print -f "%s\r" "${tag}"
#   alltags[$tag]=$(exiftool -d %s -"$tag" ${1:a} | cut -f2 -d: | tr -d \  )
#   [[ -z alltags[$tag] ]] &&  unset "alltags[$tag]"
#   print -f "% ${#tag}s\r" " "
# }
# echo " "
local -aU alltagkeys
local -AU alltags
alltagkeys=()
alltags=()
fmt="Alltags cardinality:"
fmt+='%-'
fmt+="'"
fmt+="i\n"
pv -ql =( printf "%s\n" "${(zf)void:=$(exiftool -list)}" ) | fzf


# for d in ${(k)alltags}; print -f "%s:%s\n" "$d" "${alltags[$d]}"

#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
