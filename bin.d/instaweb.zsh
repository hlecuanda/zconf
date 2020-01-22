
typeset pyver=$(python -V 2>&1 | awk -p '{print $2}' )

if (( ${+1} )) {
    typeset port=${1}
} else {
    typeset port=8080
}

case "${pyver}" in
    3.*)
        python -m http.server ${port}
        ;;
    2.*)
        python -m SimpleHTTPServer ${port}
        ;;
    *)
        echo "unknown python version ${pyver} no server started"
esac

unset pyver
unset port


#  vim: set ft=zsh sw=4 tw=0 fdm=marker foldlevel=0 et :
