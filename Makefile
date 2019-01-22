# vim: number :

DIRS=git bin vim zsh
DIRS+=tmux vnc i3 x11

ZDOTDIR=~/.zconf
.PHONY: packages tmux zsh ssh update upgrade runcoms test

# include $(DIRS).d/Makefile

install:

packages: upgrade
	@$(INSTL) zsh git tig vim tmux grep coreutils \
		binutils curl diffutils figlet file \
		grep man mosh openssh python termux-api \
		termux-tools tree
	@termux-setup-storage

