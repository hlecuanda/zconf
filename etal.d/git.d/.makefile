
SHELL         = zsh
SOURCES      != ls *g*
INSTALLED    := $(addprefix $(HOME)/.,$(SOURCES))
INSTALL_DATA  = install -m 644

.PHONY: install
.SUFFIXES: $(addprefix .,$(SOURCES))

install: $(INSTALLED)

$(INSTALLED): $(HOME)/.% : %
	$(INSTALL_DATA) $< $@
