
PFX=/data/data/com.termux/files
ETC=$(PFX)/usr/etc
HOM=$(PFX)/home
INSTALL= install -m ugo+rw,o-w --backup=numbered
.PHONY: install serverconfig personalconfig conf ssh

install: ssh conf

serverconfig: sshd_config banner | $(ETC)/ssh
	$(INSTALL) sshd_config $(ETC)/ssh
	$(INSTALL) banner $(ETC)/ssh

personalconfig:
	$(INSTALL) authorized_hosts  $(HOM)/.ssh
	$(INSTALL) config $(HOM)/.ssh

conf: personalconfig serverconfig

ssh:
	-pkg install -y -q	openssh mosh sshpass

$(ETC)/ssh:
	mkdir $(ETC)/sh

$(HOME)/.ssh:
	ssh-keygen

