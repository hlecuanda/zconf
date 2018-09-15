
.PHONY: install  zshenv runcoms


RUNCOMS = zsh.d/zlogin zsh.d/zlogout zsh.d/upreztorc zsh.d/zprofile zsh.d/zshrc 
RC = $(HOME)/.zconf/.zlogin $(HOME)/.zconf/.zlogout $(HOME)/.zconf/.zpreztorc $(HOME)/.zconf/.zprofile $(HOME)/.zconf/.zshrc 

install:  runcoms zshenv 
	
$(RC): $(RUNCOMS)

zshenv:: zsh.d/zshenv 
	install $? $(HOME)/.$@
	
$(HOME)/.zconf/.%: zsh.d/%
	install $< $@
	
