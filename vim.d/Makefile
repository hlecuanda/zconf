
SHELL         = zsh

GITRPO        = https://github.com/spf13/spf13-vim.git
LOCALS        = vimrc.before.local
LOCALS       += vimrc.bundles.local
LOCALS       += vimrc.local
TARGETS       = ~/.vimrc.before.local
TARGETS      += ~/.vimrc.bundles.local
TARGETS      += ~/.vimrc.local
SPFDIR        = ~/.spf13-vim-3
INSTALL       = install
INSTALL_DATA  = $(INSTALL) -m 664
VIMCMD        = vim +BundleInstall! +BundleClean +q
VIMDIR        = $(ZDOTDIR)/vim.d

.PHONY: install
.PHONY: clean realclean spf-install
.PHONY: changes gitcommit

default: install

install:: $(TARGETS)
install:: .spf-install

.spf-install: .spf

~/.%: $(LOCALS) | ~/.vim
	$(INSTALL_DATA) $* $@

realclean: clean
	rm -rfv ~/.spf13-vim

clean:
	rm -rfv $(TARGETS)

uninstall:
	rm -rfv ~/.vim
	[[ -d backups ]] && cp -Rav backups /** ~ || print "No backup found"

~/.vim:
	mkdir $@

.spf: | ~/.spf13-vim-3
	touch $@

~/.spf13-vim-3:
	-git clone --recursive $(GITRPO) $(SPFDIR)
	cd $(HOME) && bash $(SPFDIR)/bootstrap.sh
