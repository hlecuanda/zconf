

typeset i3config=${HOME}/.config/i3/config

genhelp() {
    typeset selection=${1}

    cat ${i3config}                                      |
    awk "/.*${1}.*\{/,/}/"                                 |
    awk '/bind/' |
    awk '{ printf( "%s - %s %s %s \n",$2,$3,$4,$5 ) }' |
    awk '{ FS="," ; print $1 }' |
    awk '{ printf("%s |",$0)  }'
}

    
cat ~/.config/i3/config |
tr \" % |
awk '/\%.*\{/ {FS="%"; print $2 }' |
rofi -dmenu -i -p mode: -bw 1 -bg-active \#1c1c1c
