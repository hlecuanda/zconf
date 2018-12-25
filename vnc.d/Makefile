
SHELL        = zsh
INSTALL      = install --backup=numbered
INSTALL_DATA = $(INSTALL) -m u+rw,go-w
INSTALL_PROG = $(INSTALL) -m u+rwx,og-wx
DESTDIR      = $(HOME)/.vnc
CONFIG_FILES = config Xresources
EXEC_FILES   = xstartup
XRESGREP     = grep -hvEe '^\!' | grep -vEe ^$$| grep -vEe '^\/'
XTARGETS     = $(DESTDIR)/$(EXEC_FILES)


.PHONY: install dir update

all: install clean .change update


install: $(TARGETS) $(XTARGETS) 


update:
	git pull
	git merge
	touch .update


.change: $(EXEC_FILES) $(CONFIG_FILES) Xres/* .gitignore | update
	git add . 
	git commit -m "Changes on $(DATE)"
	git push
	touch .change


clean:
	rm -fv Xresources

Xresources: Xres/*
	cat Xres/* | $(XRESGREP) > $@


$(XTARGETS): $(EXEC_FILES) | dir
	$(INSTALL_PROG) $? $(DESTDIR)


$(TARGETS): $(CONFIG_FILES) | dir
	$(INSTALL_DATA) $? $(DESTDIR)


dir: $(HOME)/.vnc

.gitignore: 
	cat <<< EOF \
		

$(HOME)/.vnc:
	mkdir $@

