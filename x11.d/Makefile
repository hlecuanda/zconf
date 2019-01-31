SHELL         = zsh

DATE          != date +%Y%m%d-%H%M%S
DIFF           = p4merge
DROP_COMMENTS  = awk '/^[^\#!/]/ { print $$0 }'
INSTALL        = VERSION_CONTROL=numbered install -T -b
INSTALL_DATA   = $(INSTALL) -m 755
MODELINE       = "! vim: set ft=xdefaults sw=4 tw=0 fdm=manual et :"
SED            = sed -ri -e
SET_MODELINE   = echo $(MODELINE) >> $@
XTERM_RSC_FIL  = XTerm XTerm-color UXTerm UXTerm-color
XTERM_RSC_SRC := $(addprefix /etc/X11/app-defaults/,$(XTERM_RSC_FIL))

define fileheader =
[[ -f $@ ]] && rm -fv $@ || true
figlet $@ |tr \  . | while read -r line; do echo "!// $${line}"; done > $@
print -f "\n! %s\n" "$(DATE)" >> $@
$(SED) 's/\./ /g' $@
$(SED) 's/\s+$$//' $@
endef

.PHONY: install clean diffa load

load: ~/.Xresources
	xrdb -quiet -load $^

install: ~/.Xresources

clean:
	-rm -fv Xresources*

realclean:
	-rm -fv *.xres
	-rm -fv *.ref

diff: Xresources Xresources.live
	$(DIFF) $^

10-rofi.ref:
	git checkout $@ -- || $(fileheader)
	git checkout $@ -- || rofi -dump-xresources >> $@
	git checkout $@ -- || $(SET_MODELINE)

20-XTerm.ref: $(XTERM_RSC_SRC)
	$(fileheader)
	cpp /etc/X11/app-defaults/UXTerm-color $@
	$(SET_MODELINE)

Xresources: Xresources.pre Makefile
	$(fileheader)
	cat $<  > $@
	$(SET_MODELINE)

Xresources.pre: Solarized Xtermfont Rofi
	cat $^ > $@

Xresources.live:
	$(fileheader)
	xrdb -query -all >> $@
	$(SET_MODELINE)

~/.Xresources: Xresources
	$(INSTALL_DATA) $< $@

#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
