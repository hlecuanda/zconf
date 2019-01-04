
SHELL         = zsh

OBSOLETES     = ~/.vimbackup ~/.viminfo ~/.vimswap
OBSOLETES    += ~/.vimundo ~/.vimviews
#RELOCATED     = ~/.vim/.vimbackup ~/.vim/.viminfo ~/.vim/.vimswap
#RELOCATED    += ~/.vim/.vimundo ~/.vim/.vimviews
GITRPO        = https://github.com/spf13/spf13-vim.git
LOCALS        = vimrc.before.local
LOCALS       += vimrc.bundles.local
LOCALS       += vimrc.local
TARGETS       = ~/.vimrc.before.local
TARGETS      += ~/.vimrc.bundles.local
TARGETS      += ~/.vimrc.local
SPFDIR        = ~/.spf13-vim
INSTALL       = install
INSTALL_DATA  = $(INSTALL) -m a+r-x,og-w
VIMCMD        = vim +BundleInstall! +BundleClean +q
VIMDIR        = $(ZDOTDIR)/vim.d

.PHONY: install symlink relocate reinstate clean realclean dotvim

install: $(TARGETS) | relocate
	-git clone --recursive $(GITRPO) $(SPFDIR)
	cd $(HOME) && bash $(SPFDIR)/bootstrap.sh

relocate: $(RELOCATED) | dotvim


~/.%: $(LOCALS)
	$(INSTALL_DATA) $* $@

~/.vim/%: $(OBSOLETES)
	mv -v $* $@

clean:
	rm -rfv $(TARGETS)

dotvim: ~/.vim
	mkdir -v $<

realclean: clean
	rm -rfv ~/.spf13-vim

uninstall:
	rm -rfv ~/.vim
	[[ -d backups ]] && cp -Rav backups/** ~ || print "No backup found"

#$(TARGETS): $(LOCALS)
#    $(INSTALL_DATA) $? $@

#$(RELOCATED): $(OBSOLETES)
#    mv -v $? $@

#$(OBSOLETES):


