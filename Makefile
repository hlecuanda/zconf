# vim: number :

DIRS     = git bin vim zsh
DIRS    += tmux vnc i3 x11
SHELL    = zsh
ZDOTDIR  = ~/.zconf

.PHONY: all update upgrade
.SUFFIXES=

all: ;

upgrade: update
	git pull

update:
	git fetch

clean:
	find . -name Xterm.log\* -print -delete
	for d in $(addsuffix .d,$(DIRS))\
		$(MAKE) -C $$d clean

ifdef MAKECMDGOALS

.PHONY: $(MAKECMDGOALS)

$(MAKECMDGOALS):
	for d in $(addsuffix .d,$(DIRS)) ;\
		$(MAKE) $(MFLAGS) -C $$d $(MAKECMDGOALS)

endif


#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
