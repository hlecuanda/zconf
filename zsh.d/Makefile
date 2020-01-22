include ../mk.d/common.mk

SHELL       = zsh

ifndef ZDOTDIR
ZDOTDIR     = $(HOME)/.zconf
endif

DOCKERDST   = $(ZDOTDIR)/.zprezto/modules/completion/external/src/_docker
DOCKERSRC   = https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
RUNCOMS    != ls *.zsh
RC         := $(basename $(RUNCOMS))
DOTRUNCOMS := $(addprefix $(ZDOTDIR)/.,$(RC))

.SUFFIXES:

.PHONY: install

default: install ;

install:: | $(ZDOTDIR)
install:: $(DOTRUNCOMS)
install:: $(DOCKERDST)
install:: ~/.zshenv

~/.zshenv: .zshenv
	ln -s $@ $<

$(ZDOTDIR)/.%: %.zsh
	$(INSTALL_DATA) $< $@
	chmod u-w $@

$(ZDOTDIR)/.zprezto: | $(ZDOTDIR)
	git clone -q --recursive $(PREZTO) $@

# Additional completions for docker
$(DOCKERDST): $(ZDOTDIR/.zprezto)
	curl -sfLo $@  $(DOCKERSRC)

$(ZDOTDIR):
	mkdir -p $(ZDOTDIR)

%:
	@echo " <: $< @: $@ "
