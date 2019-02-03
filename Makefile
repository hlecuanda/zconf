

include mk.d/common.mk


DIRS     = git bin vim zsh
DIRS    += tmux vnc i3 x11

.PHONY: all update upgrade
.SUFFIXES=

# Build everithing
all: ;

# Fetch and merge
upgrade: update
	git pull

# Fetch from source repo, but don't merge
update:
	git fetch

# Remove junj accumulated troughout developmeht
clean::
	find . -name Xterm.log\* -print -delete
	for d in $(addsuffix .d,$(DIRS))\
		$(MAKE) -C $$d clean

ifeq "$(MAKECMDGOALS)" 'help'
include mk.d/help.mk
else
.PHONY: $(MAKECMDGOALS)

# Build this target
$(MAKECMDGOALS):
	print $(MAKECMDGOALS)
	for d in $(addsuffix .d,$(DIRS)) ;\
		$(MAKE) $(MFLAGS) -C $$d $(MAKECMDGOALS)

endif


#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
