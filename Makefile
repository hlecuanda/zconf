
DIRS=git tmux zsh ssh		
CREPO=git@github.com:hlecuanda/zconf.git
ZREPO=git@github.com:sorin-iunescu/prezto.git


.BEGIN: $(DIRS)
	@echo including ${.TARGET}
	@if [[ -f${.TARGET}.d/Makefile ]] ; then \
		include ${.TARGET}.d/Makefile

../.zshenv: 
	@echo installing zsh runcoms
	@cd .. && ln -s .zconf/zshenv .zshenv

../.tmux.conf: 
	@echo preparing tmux
	@cd .. && tar xf tmux.tbz && ln -s \
		.termux.d/termux.conf .termux.conf

.PHONY: git zsh tmux upgrade

tmux: ../.tmux.conf upgrade
	@echo install tmux
	@pkg install tmux mosh

zsh: ../.zsh.conf git upgrade	
	@echo install zsh
	@cd .. && git clone $(REPO) .zconf
	@cd .zconf && git clone --recursive $(PREZTO)

install: git tmux zsh ssh

upgrade: 
	@echo Updating packages
	-pkg update -y -q
	-pkg uphrade -y -q
	
update: upgrade

