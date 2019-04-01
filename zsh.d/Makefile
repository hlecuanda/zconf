ifeq ($(shell uname -s), FreeBSD)
INSTALL = install -c
else
INSTALL = install -T
endif
INSTALL_DATA = $(INSTALL) -m 664
RUNCOMS != ls *.zsh
RC:=$(basename $(RUNCOMS))
ifndef ZDOTDIR
ZDOTDIR = $(HOME)/.zconf/
endif
LIVE := $(addprefix $(ZDOTDIR)/.,$(RC))

.SUFFIXES:

.PHONY: install hzshenv zdotdir

install: zshenv zdotdir $(LIVE)

hzshenv: ~/.zshenv

zdotdir: $(ZDOTDIR)/.zprezto

$(LIVE):  $(ZDOTDIR)/.%: %.zsh
	$(INSTALL_DATA) $*.zsh $@

~/.zshenv: zshenv
	$(INSTALL_DATA) $< $@

$(ZDOTDIR)/.zprezto: | $(ZDOTDIR)
	@git clone -q --recursive $(PREZTO) $(ZDOTDIR)/.zprezto

$(ZDOTDIR):
	mkdir $(ZDOTDIR)
