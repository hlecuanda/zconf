
install: $(HOME)/.tmux.conf

$(HOME)/tmux.conf: tmux.conf
	$(INSTALL_DATA) $< $@

tmux.conf: main.tmux colors-dark.tmux statusline.tmux
	cat $^                                      \
		| awk '/^[^#]/ '                        \
		| awk '! /^\s+#/'                       \
		| awk '! /source-file/'                       \
		| sed -re 's/bind(\w)/bind \1/'         \
		| sed -re 's/(..)bind(\S)/\1bind \2/'   \
		| sed -re 's/#.+$$//'                   \
		| sed -re 's/^\s+//'                    \
		| sed -re 's/set\ /set-option /'                    \
		| sed -re 's/setw\ /set-window-option /'                    \
		| tr -s \ . \
		| sort                                  \
		> $@

clean:
	rm -fv tmux.conf


# | sed -re 's/\s{2,}//g'                 \
