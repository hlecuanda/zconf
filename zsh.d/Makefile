INSTALL = install -T
INSTALL_DATA = $(INSTALL) -m 755
RUNCOMS != ls *.zsh
RC:=$(basename $(RUNCOMS))
LIVE := $(addprefix $(ZDOTDIR)/.,$(RC))
ifndef ZDOTDIR
ZDOTDIR = $HOME/.zconf/
endif

.SUFFIXES:
.SUFFIXES: .zsh .zlogin .zlogout .zshrc .zpreztorc

.PHONY: install zshenv zdotdir

install: zshenv zdotdir $(LIVE)

zshenv: $(HOME)/.zshenv

zdotdir: $(ZDOTDIR)/.zprezto

# $(LIVE): $(RUNCOMS)

$(LIVE): .% : %.zsh
	$(INSTALL_DATA) $* $@

$(HOME)/.zshenv: $(CURDIR)/zshenv
	$(INSTALL_DATA) $< $@

$(ZDOTDIR)/.zprezto:
	@git clone -q --recursive $(PREZTO) $(ZDOTDIR)/.zprezto
