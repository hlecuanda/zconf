ALLFILES     != ls *.vnc
VNCD          = $(HOME)/.vnc
INSTALPRP     = $(basename $(ALLFILES))
INSTALLED     = $(addprefix $(VNCD)/,$(INSTALPRP))
INSTALL       = install -T
INSTALL_DATA  = $(INSTALL) -m 644
SHELL         = zsh

.SUFFIXES:

.PHONY: all install vncdir

all: ;

install: $(INSTALLED)

vncdir: $(VNCD)

$(INSTALLED): $(VNCD)/% : %.vnc | vncdir
	$(INSTALL_DATA) $< $@
	@[[ $@ == "startx" ]] && chmod u+x $@ || true

$(VNCD):
	@[[ -d  $@ ]] && true || mkdir -pv $@
