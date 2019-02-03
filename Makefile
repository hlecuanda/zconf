
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

install: $(DIRS) $(GCLOUD)

$(DIRS): %: %.d
	make -C $< install

endif


#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
