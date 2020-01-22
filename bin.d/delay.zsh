#!/usr/bin/env zsh
local -A opts

zparseopts -D -E -A opts - r:: -constant::=r
if (( $+opts[-r] )); then 
    local delay=(( random-int 1 * $opts[-r] ))
else
    (( $#argv == 0 )) && k=1 || k=$1
    local delay=$(( 60 * $k ))
fi
local third=$(( $delay / 3  ))
local -i elapsed=0.0
local -i remaining=$(( $delay ))
local e=red
local f=green

until (($elapsed == $delay)) {
  if (( $remaining < $third )); then
    e=red
    r=green
  elif (( ($remaining >= $third ) && ($remaining < (2*$third)) )); then
    e=orange
    r=orange
  else
    e=green
    r=red
  fi

  print -v de -f "% 4.4d" $delay
  print -v el -f "% 4.4d" $elapsed
  print -v re -f "% 4.4d" $remaining

  print -P -f '%s %s %s \r' "%B$de%b" "%F{$r}$re" "%F{$e}$el%f"

  (( elapsed++ ))
  (( remaining-- ))
  sleep 1s
}
