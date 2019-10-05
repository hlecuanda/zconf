#!/usr/bin/env zsh
{for k in ${(k)FX}; print $k } \
  | grep -v no-                \
  | sort                       \
  | while read effect
  do
    echo $effect ${FX[$effect]} $effect ${FX[no-$effect]}
  done

# vim: set ft=zsh sw=4 tw=0 fdm=manual et :
