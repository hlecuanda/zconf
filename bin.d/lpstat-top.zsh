#!/usr/bin/env bash
let jobs=`lpstat -o |  wc -l`
echo "Pending $jobs jobs "
PRINTERS=` lpstat -a |  cut -c1-26 `
STATUS=`lpstat -p |  grep ^printer  | cut -f1 -d'.' | sed -r 's/(\S+\s){3}//'`
DEVICES=`lpstat -v |  cut -c11- | sed -r 's/^\S+: //' `
paste <(echo "$PRINTERS") <(echo "$STATUS") <(echo "$DEVICES") --delimiters ' ' | nl
echo " "
lpstat -o | cut -c1-40 | nl| head -30 | tail -5 
