SHELL  = zsh
ALLDIRS != ls *.d
BASES = $(basename $(ALLDIRS))

.SUFFIXES:
.PHONY: install

install:$(BASES)

$(BASES): %: %.d
	for d in $(ALLDIRS) \
		$(MAKE) -C $$d install
