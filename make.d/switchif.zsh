#!/usr/bin/env zsh

function ifdown () {
    iface=$argv[1]
    print -f "shutting down %s ..." $iface
    sudo ip link set "$iface" down
    print "Done!"
}

function swif {
    iface=$argv[1]
    typeset -a ifaces
    downif="${iface|*ifaces}"
    print $downif
}


ifaces=$(ip link | grep wlan | grep UP | cut -f2 -d: | tr -d \\n )

[[ ${(w)#ifaces} -ge "2" ]] && ifdown wlan0 || swif
