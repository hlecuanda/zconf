
ifdef FREEBSD

include mk.d/common.mk


# export INSTALL INSTALL_PROG INSTALL_DATA
# export SHELL

.PHONY: all clean install realclean localtest gcloud modules $(DIRS) $(DIRSDOTD)
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

$(GCLOUD):
	cd ~ && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-241.0.0-linux-x86_64.tar.gz
	cd ~ && tar xf google-cloud-sdk-241.0.0-linux-x86_64.tar.gz
	cd ~ && touch google-cloud-sdk/.hlo

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

$(MAKECMDGOALS):
	for d in $(addsuffix .d,$(DIRS)) ;\
		$(MAKE) $(MFLAGS) -C $$d $(MAKECMDGOALS)

endif


#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
