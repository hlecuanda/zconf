#!/usr/bin/env sh
OUTPUT=$1
scp passport:/srv/pbs/HLO-PrintFile.txt $OUTPUT
dos2unix -f $OUTPUT
