/usr/bin/env zsh
ps axuww | awk '/\<.+\>/ && $1=$1' OFS=","| cut -f1-11 -d,
# cut -f12- -d, 
