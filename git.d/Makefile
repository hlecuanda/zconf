DESTDIR=$(HOME)
SHELL=zsh
SOURCES != ls | grep -v Makefile
INSTALLED := $(addprefix $(HOME)/.,$(SOURCES))

.PHONY: install
.SUFFIXES: $(addprefix .,$(SOURCES))

install: $(INSTALLED)

$(HOME)/.% : .%
	$(INSTALL_DATA) $? $@
	rm -fv $<

.% :: %
	cp -rav $< $@
