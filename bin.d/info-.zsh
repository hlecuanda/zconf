#!/usr/bin/env zsh
f=`mktemp`
info --subnodes -o $f $1
info2man $f | 
nroff -mandoc | 
less
