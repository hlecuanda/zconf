#                      __
#  _______ ___  _ __  / _|
# |_  / __/ _ \| '_ \| |_
#  / / (_| (_) | | | |  _|
# /___\___\___/|_| |_|_|
#  _                 _       _
# | |__   ___   ___ | |_ ___| |_ _ __ __ _ _ __
# | '_ \ / _ \ / _ \| __/ __| __| '__/ _` | '_ \
# | |_) | (_) | (_) | |_\__ \ |_| | | (_| | |_) |
# |_.__/ \___/ \___/ \__|___/\__|_|  \__,_| .__/
#                                         |_|
# h@hlo.mx 20190402 064020 +0000 GMT 1554187220 d(-_- )b... 

function unm () {
    uname -v \
    | awk '{print $1}' \
    | sed 's/\W//g'    \
    | sed 's/[0-9]//g'
}

case $(unm) in
    Debian |Ubuntu )
        curl -L https://hlo.mx/zdeb | bash ;;
    Android)
        curl -L https://hlo.mx/zand | bash ;;
    FreeBSD)
        curl -L https://hlo.mx/zbsd | bash ;;
    * )
        echo "No Installer available" ;;
esac




# vim: set ft=sh sw=4 tw=0 fdm=manual et :