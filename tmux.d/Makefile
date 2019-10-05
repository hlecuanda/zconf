SHELL   = zsh
SOURCES = main.tmux colors-dark.tmux statusline.tmux
INSTALL = install -T
INSTALL_DATA = $(INSTALL) -m 644

install: $(HOME)/.tmux.conf

$(HOME)/.tmux.conf: $(HOME)/.% :tmux.conf
	$(INSTALL_DATA) $< $@

tmux.conf: $(SOURCES) Makefile
	[[ -f $@ ]] && rm -v $@ || true
	cat $(SOURCES) \
	  | awk '/^[^#]/ '                          \
	  | awk '! /^\s+#/'                         \
	  | awk '! /source-file/'                   \
	  | sed -re 's/bind(\w)/bind \1/'           \
	  | sed -re 's/(..)bind(\S)/\1bind \2/'     \
	  | sed -re 's/#.+$$//'                      \
	  | sed -re 's/^\s+//'                      \
	  | sed -re 's/set\ /set-option /'          \
	  | sed -re 's/setw\ /set-window-option /'  \
	  | tr -s \ .                               \
	  | sort                                    \
	  > $@

clean:
	rm -fv tmux.conf


# | sed -re 's/\s{2,}//g'                 \
