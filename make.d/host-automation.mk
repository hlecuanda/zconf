#!/usr/bin/env make
#  __  __       _        ____  _
#  |  \/  | __ _| | _____|  _ \(_)
#  | |\/| |/ _` | |/ / _ \ |_) | |
#  | |  | | (_| |   <  __/  __/| |
#  |_|  |_|\__,_|_|\_\___|_|   |_|
# h@h-lo.me 20190712 002214 -0700 PDT 1562916134 d(-_- )b...

RM        = rm -rfv
domain    = lecuanda.com
iface     = $<.dhcp
ifaces    = wlan0 wlan1
dotifaces = $(addprefix .,$(ifaces))
mark      = touch $@
pihole    = 172.17.42.1
resfile   = resolv.conf
resolver  = sudo resolvconf
SHELL     = zsh

# dirty
# DOMAIN='$(domain)'
# SEARCH='$(domain)'
# NAMESERVERS='$(pihole)'
# LOCALNAMESERVERS='$(pihole)'
# trick

.SUFFIXES: $(ifaces)
.PHONY: clean pihole-resolver $(ifaces)
.INTERMEDIATE:$(resfile) .start .resolver-*
pihole-resolver:  $(addsuffix .dhcp,$(dotifaces))

$(resfile):
	 cat * | awk '/\# dirty/, /\# trick/ { print $2  }' \
		 | awk '/=/' > $@

.%.dhcp: $(ifaces)
	$(resolver) -f -d $(iface)
	$(resolver) -a $(iface) $(resfile)  < $(resfile)
	$(resolver) -u
	$(resolver) -l $(iface)
	cat /etc/$(resfile)
	$(RM) $(resfile)
	$(mark)

clean::
	$(RM) .start
	$(RM) .resolver.*
	$(RM) $(resfile)

$(ifaces): $(resfile)

#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
