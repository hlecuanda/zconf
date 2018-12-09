
../.tmux.conf: 
	@echo preparing tmux
	@cd .. && tar xf tmux.tbz && ln -s \
		.termux.d/termux.conf .termux.conf

tmux: ../.tmux.conf upgrade 
	@echo install tmux
	@pkg install tmux mosh
