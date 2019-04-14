ALLFILES     != ls *.*
CFGSUB        = $(HOME)/.config/ranger
INSTALLED     = $(addprefix $(CFGSUB)/,$(ALLFILES))
INSTALL       = install -T
INSTALL_DATA  = $(INSTALL) -m 644
SHELL         = zsh

.SUFFIXES:

.PHONY: all install cfgsub

all: ;

install: $(INSTALLED)

cfgsub: $(CFGSUB)

$(INSTALLED): $(CFGSUB)/% : % | cfgsub
	$(INSTALL_DATA) $< $@
	@[[ $@ == "scope.sh" ]] && chmod u+x $@ || true

$(CFGSUB):
	@[[ -d  $@ ]] && true || mkdir -pv $@
