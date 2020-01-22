#!/usr/bin/env zsh
#
#   __             _        _             _
#  / _| ___  _ __ | |_ __ _| |_   _ _ __ | |__  ___
# | |_ / _ \| '_ \| __/ _` | | | | | '_ \| '_ \/ __|
# |  _| (_) | | | | || (_| | | |_| | |_) | | | \__ \
# |_|  \___/|_| |_|\__\__, |_|\__, | .__/|_| |_|___/
#                     |___/   |___/|_|
# h@h-lo.me 20191020 075228 -0700 PDT 1571583148 d(-_- )b...
#
#
READNULLCMD=/bin/cat
NULLCMD=echo

(/bin/cat - >! data )<<EOF
SetiUICustom:e5fa:e62b
Devicons:e700:e7c5
FontAwesome:f000:f2e0
FontAwesomeExtension:e200:e2a9
MaterialDesignIcons:f500:fd46
Weather:e300:e3eb
Octicons:f400:f4a8
Octicons:2665:2665
Octicons:26A1:26A1
Octicons:f27c:f27c
PowerlineExtraSymbols:e0a3:e0a3
PowerlineExtraSymbols:e0b4:e0c8
PowerlineExtraSymbols:e0cc:e0d2
PowerlineExtraSymbols:e0d4:e0d4
IECPowerSymbols:23fb:23fe
IECPowerSymbols:2b58:2b58
FontLogos:f300:f313
Pomicons:e000:e00d
EOF
typeset -i grand=0

cat data | while read line
do
  descr=$(echo $line | cut -f1 -d:)
  lower=$(echo $line | cut -f2 -d:)
  upper=$(echo $line | cut -f3 -d:)

  typeset -i count=0
  width=$(( 0x$upper - 0x$lower  ))
  for n in {$(( 0x$lower  ))..$(( 0x$upper ))}
  do
    LC_NUMERIC=en_US:UTF-8 \
      printf "%'4.4i:%'4.4i:%s:%'i:%4.4x (%i) %s\n" \
      $grand $count $descr $n $n $(( $width - $count )) ${(#)n}
    (( count+=1 ))
    (( grand+=1 ))
  done

done


rm -rf data
# a='e000'
# b='e00d'
# for i in {$((0x$a))..$((0x$b))}
#   print -f "%d -> %4.2x  \n" $i $i
