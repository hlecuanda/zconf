#!/usr/bin/env bash

HOST=$1
OLDGZIP=$GZIP
DUCMD="bash -c 'du -b --time=access --time-style=long-iso \
       --exclude=/dev/* --exclude=/var/run/* --exclude= /var/lock/* \
       --exclude /sys/fs/cgroup/* --separate-dirs 2>/dev/null'"

export GZIP='-c9'

/usr/bin/ssh $HOST sudo $DUCMD |
pv -lcN "ssh"  -w 65 -s 11822  |
gzip 2> errors.log             |
pv  -cN "gzip" -w 65           > $HOST-dudata.gz

export GZIP=$OLDGZIP
