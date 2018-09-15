# vim: number : 

MFS!=find . -name Makefile -mindepth 2 -maxdepth 2
INSTL=pkg install -y -q 
PACKAGES!=cat packages
	
ZDOTDIR=$(HOME)/.zconf
	
.PHONY: install packages upgrade 

install: upgrade packages gcloud

include $(MFS)

packages: upgrade	
	-$(INSTL) $(PACKAGES)
	termux-setup-storage

upgrade: 
	-pkg update -y -q

$(HOME)/usr/google-cloud-sdk:
	-curl sdk.cloud.google.com | sh

gcloud: $(HOME)/usr/google-cloud-sdk
	-gcloud components update

termux:
	cp -Rav termux.d $(HOME)/.termux

config:
	cp -Rav config.d $(HOME)/.config

