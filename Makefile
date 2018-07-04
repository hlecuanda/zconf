# vim: number : 

DIRS=git tmux zsh ssh		
CREPO=git@github.com:hlecuanda/zconf.git
ZREPO=git@github.com:sorin-iunescu/prezto.git

.PHONY: packages tmux zsh ssh update upgrade	

.BEGIN: $(DIRS)
	@echo including ${.TARGET}
	@if [[ -f ${.TARGET}.d/Makefile ]] ; then \
		include ${.TARGET}.d/Makefile

packages: upgrade	
	
install: upgrade git tmux zsh ssh 

upgrade: 
	@echo in upgrade	
	@echo Updating packages
	-pkg update -y -q
	
update: 
	@echo in update
	@(pkg list-installed | grep -v automatic > packages)
		
../.zshenv: 
	@echo installing zsh runcoms
	@cd .. && ln -s .zconf/zshenv .zshenv 

zsh: ../.zsh.conf git upgrade 
	@echo install zsh
	@cd .. && git clone $(REPO) .zconf
	@cd .zconf && git clone --recursive $(PREZTO)


