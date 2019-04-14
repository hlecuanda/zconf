ifdef FREEBSD
INSTALL         = install -c
else
INSTALL         = install -T
endif
INSTALL_DATA    = $(INSTALL) -m 664
RUNCOMS        != ls *.zsh
RC             := $(basename $(RUNCOMS))
ifndef ZDOTDIR
ZDOTDIR         = $(HOME)/.zconf
endif
DOTRUNCOMS           := $(addprefix $(ZDOTDIR)/.,$(RC))
DOCKERSRC       = https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

.SUFFIXES:

.PHONY: install zshenv zdotdir

install: zshenv zdotdir $(DOTRUNCOMS)

~/.zshenv: zshenv
	$(INSTALL_DATA) $< $@

zdotdir: $(ZDOTDIR)/.zprezto

$(DOTRUNCOMS):  $(ZDOTDIR)/.%: %.zsh
	$(INSTALL_DATA) $*.zsh $@

$(ZDOTDIR)/.zprezto: | $(ZDOTDIR)
	@git clone -q --recursive $(PREZTO) $(ZDOTDIR)/.zprezto
	curl -fLo $(ZDOTDIR)/.zprezto/modules/completion/external/src/_docker $(DOCKERSRC)

$(ZDOTDIR):
	mkdir -p $(ZDOTDIR)
