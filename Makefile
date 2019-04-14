
ifdef FREEBSD

include mk.d/common.mk
ALLCODE     != find . -type f
ADDTOCLEAN   = echo "$@" >>! .clean
DIRS     = git bin vim zsh
DIRS    += tmux vnc i3 x11
SHELL    = zsh
ZDOTDIR  = ~/.zconf
INSTALL_DATA=$(INSTALL) -m 644
INSTALL_PROG=$(INSTALL) -m 754



.PHONY: all update upgrade $(DIRS)
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

$(DIRS): % : %.d
	$(MAKE) -C $*.d

clean:
	-[[ -n "$$(find . -name Xterm.log* -print | head -1 )" ]] && \
		find . -name Xterm.log* -print -delete || true
	-[[ -f ~/google-cloud-sdk-*.tar.gz ]] && \
		rm -v ~/google-cloud-sdk-*.tar.gz || true
	-docker container stop zconf:testbox
	-docker container rm zconf:testbox --force
	-docker image prune -a -f
	# for d in $(addsuffix .d,$(DIRS))\
	#     $(MAKE) -C $$d clean

realclean: clean
	-rm -rf ~/google-cloud-sdk
	-rm -rfv ~/bin


#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
