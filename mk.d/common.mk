
ifeq ($(shell uname -s),FreeBSD)
INSTALL=install -c
else
INSTALL=install -T
endif

SHELL    = zsh
ZDOTDIR  = ~/.zconf
INSTALL_DATA =$(INSTALL) -m 644
INSTALL_PROG =$(INSTALL) -m 754


define fileheader =
[[ -f $@ ]] && rm -fv $@ || true
figlet $@ |tr \  . | while read -r line; do echo "!// $${line}"; done > $@
print -f "\n! %s\n" "$(DATE)" >> $@
$(SED) 's/\./ /g' $@
$(SED) 's/\s+$$//' $@
endef

