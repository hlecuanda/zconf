
ifdef FREEBSD

include mk.d/common.mk



.PHONY: all clean install image realclean localtest
.PHONY: gcloud modules $(DIRS) $(DIRSDOTD)

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

clean: .clean
	-[[ -n "$$(find . -name Xterm.log* -print | head -1 )" ]] && \
		find . -name Xterm.log* -print -delete || true
	-[[ -f ~/google-cloud-sdk-*.tar.gz ]] && \
		rm -v ~/google-cloud-sdk-*.tar.gz || true
	for target in "$$(<$<)" ; { rm -rfv target }
	# -docker container stop zconf:testbox
	# -docker container rm zconf:testbox --force
	# -docker image prune -a -f
	# for d in $(addsuffix .d,$(DIRS))\
	#     $(MAKE) -C $$d clean

.clean: ; # targets add their dirt to this file

realclean: clean
	-rm -rf ~/google-cloud-sdk
	-rm -rfv ~/bin


#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
