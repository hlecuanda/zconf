#!/bin/sh
# vim: ft=sh :

HOST=$1

TERMLIST=`ls . | grep -v sh$`

ssh $HOST mkdir "TERMS"
for CURTERM in $TERMLIST
do
    scp $CURTERM "$HOST:TERMS" 2&>/dev/null
    ssh $HOST tic "TERMS/$CURTERM" 2&>/dev/null
done
