
.PHONY: zsh zprezto zshenv runcoms

zsh: runcoms zshenv zprezto

zprezto: $(ZDOTDIR)/.zprezto

zshenv: $(HOME)/.zshenv
	
runcoms: $(ZDOTDIR)/.$(RUNCOMS)

$(ZDOTDIR)/.$(RUNCOMS):
	@echo installing $(.TARGET)
	@install $(.IMPSRC) $(ZDOTDIR)/.$(IMPSRC)

$(HOME)/.zshenv:
	@echo installing $(.TARGET)
	@install .zshenv $(.TARGET)

$(ZDOTDIR)/.zprezto:
	@git clone -q --recursive $(PREZTO) $(ZDOTDIR)/.zprezto
