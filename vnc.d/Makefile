
SHELL        = zsh
INSTALL      = install --backup=numbered
INSTALL_DATA = $(INSTALL) -m u+rw,go-w
INSTALL_PROG = $(INSTALL) -m u+rwx,og-wx
DESTDIR      = $(HOME)/.vnc
CONFIG_FILES = config Xresources
EXEC_FILES   = xstartup
XRESGREP     = grep -hvEe '^\!' | grep -vEe ^$$| grep -vEe '^\/'
XTARGETS     = $(DESTDIR)/$(EXEC_FILES)
TARGETS     != for file in $(CONFIG_FILES) ; do echo $(DESTDIR)/$${file} ; done

.PHONY: install dir

install: $(TARGETS) $(XTARGETS)


Xresources: Xres/*
	cat Xres/* | $(XRESGREP) > $@


$(XTARGETS): $(EXEC_FILES) | dir
	$(INSTALL_PROG) $? $(DESTDIR)


$(TARGETS): $(CONFIG_FILES) | dir
	$(INSTALL_DATA) $? $(DESTDIR)


dir: $(HOME)/.vnc


$(HOME)/.vnc:
	mkdir $@

