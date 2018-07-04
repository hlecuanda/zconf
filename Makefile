# vim: number : 

DIRS=git tmux zsh ssh		
CREPO=git@github.com:hlecuanda/zconf.git
ZREPO=git@github.com:sorin-iunescu/prezto.git

.PHONY: packages tmux zsh ssh 

.BEGIN: $(DIRS)
	@echo including ${.TARGET}
	@if [[ -f${.TARGET}.d/Makefile ]] ; then \
		include ${.TARGET}.d/Makefile

packages: update
	@pkg list-installed > packages | grep -v automatic 

../.zshenv: 
	@echo installing zsh runcoms
	@cd .. && ln -s .zconf/zshenv .zshenv 

../.tmux.conf: 
	@echo preparing tmux
	@cd .. && tar xf tmux.tbz && ln -s \
		.termux.d/termux.conf .termux.conf

tmux: ../.tmux.conf upgrade .PHONY
	@echo install tmux
	@pkg install tmux mosh

zsh: ../.zsh.conf git upgrade .PHONY	
	@echo install zsh
	@cd .. && git clone $(REPO) .zconf
	@cd .zconf && git clone --recursive $(PREZTO)

install: git tmux zsh ssh .PHONY

upgrade: .PHONY
	@echo Updating packages
	-pkg update -y -q
	
update: upgrade .PHONY

