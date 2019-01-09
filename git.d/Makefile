ifeq ($(shell uname -s),FreeBSD)
INSTALL=install -c
else
INSTALL=install -T
endif
INSTALL_PROGRAM=$(INSTALL) -m 755
INSTALL_DATA=$(INSTALL) -m 644
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
