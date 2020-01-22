#!/usr/bin/env zsh

emulate -L zsh
setopt localoptions

local ptype chosen sel="-n"
local -A proj_types

zparseopts -D -E -a opts -- m -h=hlp --help=h

(( $+hlp )) && { docs=$(<&0) <<-EODOC
H4sIAE/IFl4AA2VRwU7DMAy99yt82AGkbXDuGSRAmkCIG+IQUnfNlsbFcZgmxL/j
ZO06iVwSx/Z7z89Vtfi5/a3BMhpBMDAw7dAKNI71Ij5Cy9RrQrAfvNZUFeh5G6MI
jNE1CC7A4uF5c39zzqwvqwzjDFkQonCykrQdpDMCloIYRTHe6wcCeuwxSCb4StrZ
QEs8C1wWkMdgfWpc2MLG7LF1fo9xCXdk98ga5SCmz4nY5RjFqrKnFKUgjINnxmnC
i9lTaJBLMmtxFFQGE8n65EKKZov16Q2QnYR3GnJd/IAGo7hgcjRVXHzVBXVmOnSo
Fh0p8XkFB6dWePc9Wj4Cj3SrbgmrVYd+qOGFXRDFc1FlxqxpIpzPawrTJvuTVQhX
paXQUPACaDsqsnQpycs/DBeioGmA2oyRXc/FRrdo/DzK+rr6A67f97dWAgAA
EODOC
<<< $docs |  base64 -d | gunzip - | sed -Ee "s/\{0}/$0/g"
return }

for ptype in $(ls ~/Templates/*.d)
  proj_types[${ptype:r:t}]="${ptype}"

proj_types[exit]=":"

PS3="\n\nWhat kind of project shall we build today?\n"
select chosen in ${(k)proj_types}
do
  print "\n\n..a $chosen project? Exellent choice!\n\n... Initializing"
  case $chosen in
    exit)
      break ;;
    *)
      [[ "-n" == "${sel:*opts}" ]] && echo $proj_types[$chosen] \
        || mkdir -p $proj_types[$chosen] \
      break ;;
  esac
done

#  vim: set ft=zsh sw=2 tw=0 fdm=manual et
