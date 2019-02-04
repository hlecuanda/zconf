# vim: number :

# conditional statement using prompt expansion to
# test exit statusnof last command 	:w
#
 # [[ ftw == ftw ]] && true || false
 # pstring=%1(?.failed.ftw)

MFS!=find .  -mindepth 2 -maxdepth 2 -name Makefile
INSTL=pkg install -y -q
PACKAGES!=cat packages
MODULES != for d in $(find . -name \*.d ) ; do if [[ -f $d/Makefile ]] echo $d ; done

ZDOTDIR=$(HOME)/.zconf

.PHONY: install upgrade packages

install: packages gcloud modules

$(MODULES):

packages: packages-list
	-$(INSTL) $(PACKAGES)
	termux-setup-storage

packages-list:
	-rm -v $@
	pkg list-installed -q | \
		grep -v automatic | \
		grep -ve '^lib'   | \
		cut -f1 -d\/ > $@

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

