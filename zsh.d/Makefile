include ../mk.d/common.mk
include ../mk.d/help.mk:

RUNCOMS != ls *.zsh
RC:=$(basename $(RUNCOMS))
ifndef ZDOTDIR
ZDOTDIR = $(HOME)/.zconf/
endif
LIVE := $(addprefix $(ZDOTDIR)/.,$(RC))

.SUFFIXES:

.PHONY: install zshenv zdotdir

install: zshenv zdotdir $(LIVE)

zshenv: $(HOME)/.zshenv

zdotdir: $(ZDOTDIR)/.zprezto

$(LIVE):  $(ZDOTDIR)/.%: %.zsh
	$(INSTALL_DATA) $*.zsh $@

$(HOME)/.zshenv:
	$(INSTALL_DATA) $< $@

$(ZDOTDIR)/.zprezto: | $(ZDOTDIR)
	@git clone -q --recursive $(PREZTO) $(ZDOTDIR)/.zprezto

$(ZDOTDIR):
	mkdir $(ZDOTDIR)
