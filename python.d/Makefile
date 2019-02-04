PIP        = pip install --upgrade
PIP2      := pip2 install --upgrade
USERSITE  := $(ZDOTDIR)/python.d/usersite
VERSIONS   = 3.6 2.7
USERSITES := $(foreach ver,$(VERSIONS),$(addsuffix /$(ver),$(USERSITE)))
ZSHRC      = $(ZDOTDIR)/.zshrc
FILESIGIe  = '/^# AUTO python version/ /^# AUTO / { print $$(VERSIONVAR) } '

.PHONY: install usersites addvar

install:

usersites: $(USERSITES) ;

addvar:
	cat $(ZSHRC) | awk '$(FILESIGIL) { print "something" } '



$(USERSITES):
	mkdir $@
