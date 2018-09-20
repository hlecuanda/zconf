# vim: number : 

# MFS!=find . -name Makefile -mindepth 2 -maxdepth 2
INSTL=sudo apt-get install -y -q 
PACKAGES!=cat packages
	
ZDOTDIR=$(HOME)/.zconf
	
.PHONY: install packages upgrade gcloud

install: upgrade packages zsh gcloud

# include $(MFS)

packages: upgrade	
	-$(INSTL) $(PACKAGES)

zsh: .zprezto
	chsh -s /bin/zsh

upgrade: 
	-sudo apt-get update -y -q
	-sudo apt-get upgrade -y -q

.zprezto:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git .zprezto

gcloud: 
	-curl sdk.cloud.google.com | sh
	-gcloud components update

$(HOME)/.config: config.d/*
	cp -Rav config.d $(HOME)/.config
