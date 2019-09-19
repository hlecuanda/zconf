INSTALL= install
INSTALL_DATA= $(INSTALL) -m 644
INSTALL_PROG= $(INSTALL) -m 755
BINDIR=$(HOME)/bin
SOURCES!= ls *.*
INSTALL=install
SHELL=zsh
INSTALLED!= for f in $(SOURCES); do echo $(BINDIR)/$${f} | cut -f1 -d'.' ; done
.SUFFIXES:
.SUFFIXES:zsh sh py pl tcsh csh awk

# .PHONY: install

install: all

# $(INSTALLED):
#     $(INSTALL_PROG) $* $@

all: $(INSTALLED)

$(INSTALLED): | $(BINDIR)

$(BINDIR):
	mkdir $(BINDIR)

$(BINDIR)/%:: %.zsh
	$(INSTALL_PROG) $? $@

$(BINDIR)/%:: %.sh
	$(INSTALL_PROG) $? $@

$(BINDIR)/%:: %.py
	$(INSTALL_PROG) $? $@

$(BINDIR)/%:: %.pl
	$(INSTALL_PROG) $? $@

$(BINDIR)/%:: %.tcsh
	$(INSTALL_PROG) $? $@

$(BINDIR)/%:: %.csh
	$(INSTALL_PROG) $? $@

$(BINDIR)/%:: %.awk
	$(INSTALL_PROG) $? $@

$(BINDIR)/%:: %.md
	$(INSTALL_DATA) $? $@.md

