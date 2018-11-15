
SHELL = zsh
GITRPO = https://github.com/spf13/spf13-vim.git
LOCALS = $(VIMDIR)/vimrc.before.local
LOCALS += $(VIMDIR)/vimrc.bundles.local
LOCALS += $(VIMDIR)/vimrc.local
SPFDIR = ~/.spf13-vim
INSTAL = install 
VIMCMD = vim +BundleInstall! +BundleClean +q
VIMDIR = $(ZDOTDIR)/vim.d

.PHONY: install update  symlink

install:
	-git clone --recursive $(GITRPO) $(SPFDIR)
	-mkdir bkp
	-touch bkp/.gitignore
	cd $(HOME) && bash $(SPFDIR)/bootstrap.sh
	$(MAKE) symlink
#	$(VIMCMD)

symlink: $(LOCALS)
	for loc in ( $(LOCALS) );         \
		cd ~ \;
		install -pv $(VIMDIR)/$$loc ./.$$loc

update: backup
	git pull
	$(VIMCMD)

clean:
	@rm -rfv ~/.vimrc.*

realclean: clean
	@rm -rfv ~/.spf13-vim

