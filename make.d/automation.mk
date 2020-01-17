
SHELL   = zsh

default: ;

switch-wifi:
	ifaces=$$(ip link | grep wlan | cut -f2 -d: | tr -d \\n ) ; \
    [[ $${(w)#ifaces} -ge "2" ]] && echo ifdown || echo whichif
