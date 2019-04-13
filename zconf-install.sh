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

function filetests(){
    [ -d /google ] && \
        curl -L https://hlo.mx/zdeb | bash
    [ -f /usr/bin/rpi-config ] \
        curl -L https://hlo.mx/zdeb | bash
}

case $(uname -a) in
    *GNU/Linux*)
        [ -f /usr/bin/yum ] &&  { \
            echo "Installing for CentOS" ;
            curl -L hlo.mx/zcen | bash }
        
        [ -f /usr/bin/apt ] &&  { \
            echo "Installing for Debian-derived distribution" ;
            curl -L hlo.mx/zdeb | bash } && exit 0 || exit 1 \
        ;;
    *Android*)
        echo "Installing for Android/Termux"
        curl -L https://hlo.mx/zand | bash
        ;;
    *FreeBSD*)
        echo "Installing for FreeBSD"
        curl -L https://hlo.mx/zbsd | bash
        ;;
    * )
        echo "No Installer available"
        ;;
esac




# vim: set ft=sh sw=4 tw=0 fdm=manual et :
