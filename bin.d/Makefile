BINDIR=$(HOME)/bin
SOURCES!= ls *.*
INSTALL=install
INSTALL_EXECUTABLE=$(INSTALL) -m a+x 
INSTALL_DATA=$(INSTALL) -m 644
SHELL=zsh
INSTALLED!= for f in $(SOURCES); do echo $(BINDIR)/$${f} | cut -f1 -d'.' ; done 
.SUFFIXES:
.SUFFIXES:zsh sh py pl tcsh csh awk

# .PHONY: install

install: all

# $(INSTALLED):
#     $(INSTALL_EXECUTABLE) $* $@

all: $(INSTALLED)

$(INSTALLED): | $(BINDIR)

$(BINDIR):
	mkdir $(BINDIR)

$(BINDIR)/%:: %.zsh 
	$(INSTALL_EXECUTABLE) $? $@

$(BINDIR)/%:: %.sh
	$(INSTALL_EXECUTABLE) $? $@

$(BINDIR)/%:: %.py
	$(INSTALL_EXECUTABLE) $? $@

$(BINDIR)/%:: %.pl
	$(INSTALL_EXECUTABLE) $? $@

$(BINDIR)/%:: %.tcsh
	$(INSTALL_EXECUTABLE) $? $@

$(BINDIR)/%:: %.csh
	$(INSTALL_EXECUTABLE) $? $@

$(BINDIR)/%:: %.awk
	$(INSTALL_EXECUTABLE) $? $@

$(BINDIR)/%:: %.md
	$(INSTALL_DATA) $? $@.md

