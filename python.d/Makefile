PIP        = pip install --upgrade
PIP2      := pip2 install --upgrade
USERSITE  := $(ZDOTDIR)/python.d/usersite
VERSIONS   = 3.6 2.7
USERSITES := $(foreach ver,$(VERSIONS),$(addsuffix /$(ver),$(USERSITE)))
ZSHRC      = $(ZDOTDIR)/.zshrc
FILESIGIe  = '/^# AUTO python version/ /^# AUTO / { print $$(VERSIONVAR) } '
VER =3.6:

.PHONY: install usersites addvar versionlink

install:

usersites: $(USERSITES) ;

versionlink: $(HOME)/bin/python

addvar:
	cat $(ZSHRC) | awk '$(FILESIGIL) { print "something" } '

$(HOME)/bin/python: .chgversion
	[[ -s $@ ]] && rm $@
	ln -s $(PREFIX)/python$(VER) $@

.chgversion: ;

$(USERSITES):
	mkdir $@
