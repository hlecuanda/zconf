
.PHONY: install  zshenv runcoms
.SHELL: zsh

RUNCOMS!=ls zsh.d/z*

install:  runcoms zshenv 

zshenv:: zsh.d/zshenv 
	install $? $(HOME)/.$@
	
runcoms:: $(RUNCOMS)
	for rc in $$(RUNCOMS) \
		install $$rc $(ZDOTDIR)/.$@

