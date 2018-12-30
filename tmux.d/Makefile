SHELL        = zsh
TMUX_CFG     = $(HOME)/.tmux.conf
SEGMENTS    != ls **/0*.tmux
INSTALL      = install
INSTALL_DATA = $(INSTALL) -m ug+rw,o+r -T

.PHONY: install

install: $(TMUX_CFG)

$(TMUX_CFG): tmux.conf build.zsh
	$(INSTALL_DATA) $< $@

tmux.conf: $(SEGMENTS)
	-rm -fv tmux.conf
	./build.zsh

