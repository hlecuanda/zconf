SRC_DIRS != ls -d
DOTCONFG = $(HOME)/.config
DIRS := $(prefix .d $(SRC_DIRS))

.PHONY: all

all: $(DIRS)

$(HOME)/%: %.d | $(DOTCONFG)
	mkdir -p $@

$(DOTCONFG):
	mkdir -p $@
