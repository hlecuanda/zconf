
ifeq ($(shell uname -s),FreeBSD)
INSTALL=install -c
else
INSTALL=install -T
endif

DIRS     = git bin vim zsh
DIRS    += tmux vnc i3 x11
SHELL    = zsh
ZDOTDIR  = ~/.zconf
INSTALL_DATA=$(INSTALL) -m 644
INSTALL_PROG=$(INSTALL) -m 754

export INSTALL INSTALL_PROG INSTALL_DATA
export SHELL


.PHONY: all update upgrade $(DIRS)
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

$(DIRS): % : %.d
	$(MAKE) -C $*.d


# ifdef MAKECMDGOALS

# .PHONY: $(MAKECMDGOALS)

# $(MAKECMDGOALS):
#     for d in $(addsuffix .d,$(DIRS)) ;\
#         $(MAKE) $(MFLAGS) -C $$d $(MAKECMDGOALS)

# endif


#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
