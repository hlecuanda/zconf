ifeq ($(shell uname -s), FreeBSD)
INSTALL = install -c
else
INSTALL = install -T
endif
INSTALL_DATA = $(INSTALL) -m 755
RUNCOMS != ls *.zsh
RC:=$(basename $(RUNCOMS))
LIVE := $(addprefix $(ZDOTDIR)/.,$(RC))
ifndef ZDOTDIR
ZDOTDIR = $(HOME)/.zconf/
endif


.SUFFIXES:
.SUFFIXES: .zsh

.PHONY: install zshenv zdotdir

install: zshenv zdotdir $(LIVE)

zshenv: $(HOME)/.zshenv

zdotdir: $(ZDOTDIR)/.zprezto


$(LIVE): $(ZDOTDIR)/.% : %.zsh
	$(INSTALL_DATA) $? $@

$(HOME)/.zshenv: $(CURDIR)/zshenv
	$(INSTALL_DATA) $< $@

$(ZDOTDIR)/.zprezto:
	@git clone -q --recursive $(PREZTO) $(ZDOTDIR)/.zprezto
