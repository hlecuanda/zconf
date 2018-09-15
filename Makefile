# vim: number : 

MFS!=find . -name Makefile -mindepth 2
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

gcloud::
	-curl sdk.cloud.google.com | sh
