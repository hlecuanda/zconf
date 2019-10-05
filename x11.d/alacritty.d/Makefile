
SHELL      = zsh
AWK       := $(shell which awk)
CAT        = /bin/cat
TIC       := $(shell which tic)
TERMINALS  = alacritty xterm-256color tmux tmux-256color
TERMINFOS := $(addsuffix .terminfo, $(TERMINALS))
INSTALLED  = $(addsuffix .done,$(TERMINFOS))

ifndef TERMINFO
TERMINFO=~/.terminfo
endif

define ITALICS_INFO
@echo "$(basename $@)|$(basename $@) with standout and italic, " >$@
@echo ' smso=\E[3m, rmso=\E[23m, ' >> $@
@echo ' stim=\E[7m, rtim=\E[27m, ' >> $@
@echo " use=$(basename $@), " >> $@
endef

.PHONY: tmux clean install

install: $(INSTALLED)

$(INSTALLED): %.terminfo.done: %.terminfo
	$(TIC) -xo$(TERMINFO) $<
	touch $@

alacritty.terminfo:
	$(ITALICS_INFO)

xterm-256color.terminfo:
	$(ITALICS_INFO)

tmux-256color.terminfo:
	$(ITALICS_INFO)

tmux.terminfo:
	$(ITALICS_INFO)
	$(CAT) $@ \
      | awk '!/use/ { print $0 }; \
	  /use/ { print "  use=screen," }' \
      > $@.fix
	rm -f $@
	mv $@.fix $@

clean:
	-rm -v *.terminfo
	-rm -v *.done
	-rm -rfv $(TERMINFO)
