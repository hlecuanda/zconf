DESTDIR=$(HOME)
SHELL=zsh
SOURCES != ls | grep -v Makefile
INSTALLED := $(addprefix $(HOME)/.,$(SOURCES))
INSTALL_DATA = install -m 644

.PHONY: install
.SUFFIXES: $(addprefix .,$(SOURCES))

install: $(INSTALLED)

$(HOME)/.tigrc: tigrc
	$(INSTALL_DATA) $< $@

$(HOME)/.gitconfig: gitconfig
	$(INSTALL_DATA) $< $@

$(HOME)/.git-flow.tigrc: git-flow.tigrc
	$(INSTALL_DATA) $< $@
