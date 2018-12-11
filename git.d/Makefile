

INSTALL=install
INSTALL_PROGRAM=$(INSTALL)
INSTALL_DATA=$(INSTALL) -m 644 -T
DESTDIR=$(HOME)
SHELL=zsh
SOURCES != ls | grep -v Makefile 
INSTALLED != for file in ${SOURCES}; echo "$(DESTDIR)/.$${file}" 

.PHONY: install

install: $(SOURCES)
	$(MAKE) $(INSTALLED)

$(DESTDIR)/.tigrc: tigrc
	$(INSTALL_DATA) $? $@

$(DESTDIR)/.gitconfig: gitconfig
	$(INSTALL_DATA) $? $@
