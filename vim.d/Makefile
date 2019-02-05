
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
INSTALL_DATA  = $(INSTALL) -m 664
VIMCMD        = vim +BundleInstall! +BundleClean +q
VIMDIR        = $(ZDOTDIR)/vim.d

.PHONY: install symlink relocate reinstate
.PHONY: clean realclean dotvim spf-install
.PHONY: changes gitcommit

install: $(TARGETS) spf-install

spf-install                                       : ~/.spf13-vim

ifeq "$(MAKECMDGOALS)" "changes"
changes: gitcommit .changed-makefile

.changed-makefile: Makefile
	git add $<
	touch .changed-makefile

$(LOCALS): %.local : ~/.%.local
	cp -afv $< $@
	git add $@

gitcommit: $(LOCALS) | .changed-makefile
	git commit -m "Changes from $$(date +%Y%m%d)"
	git fetch
else
~/.%                                              : $(LOCALS)
	$(INSTALL_DATA) $* $@
endif

relocate                                          : $(RELOCATED) | dotvim

dotvim                                            : ~/.vim

realclean                                         : clean
	rm -rfv ~/.spf13-vim

clean                                             :
	rm -rfv $(TARGETS)

uninstall                                         :
	rm -rfv ~/.vim
	[[ -d backups ]] && cp -Rav backups /** ~ || print "No backup found"

~/.vim/%                                          : $(OBSOLETES)
	mv -v $* $@

~/.vim:
	mkdir $@

~/.spf13-vim:
	-git clone --recursive $(GITRPO) $(SPFDIR)
	cd $(HOME) && bash $(SPFDIR)/bootstrap.sh
