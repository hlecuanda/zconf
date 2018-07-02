
../.gitconfig: gitconfig
	@echo installing gitconfig
	@cd .. && ln -s .zconf/gitconfig .gitconfig

../.zshenv: zshenv
	@echo installing zsh runcoms
	@cd .. && ln -s .zconf/zshenv .zshenv

../.tmux.conf: tmux.conf
	@echo preparing tmux
	@cd .. && tar xf tmux.tbz && ln -s \
		.termux.d/termux.conf .termux.conf

.PHONY: git zsh tmux upgrade

git: ../.gitconfig upgrade	
	@echo installing git
	@pkg install -y git tig diffutils openssh

tmux: ../.tmux.conf upgrade
	@echo install tmux
	@pkg install tmux mosh

zsh: ../.zsh.conf git upgrade	
	@echo install zsh
	@cd .. && git clone $(REPO) .zconf
	@cd .zconf && git clone --recursive $(PREZTO)

install: git tmux zsh

upgrade: 
	@echo Updating packages
	-pkg update -y -q
	-pkg upgrade -y -q
	
update: upgrade

