	
PFX=/data/data/com.termux/files
ETC=${PFX}/usr/etc
HOM=${PFX}/home		

.PHONY: install serverconfig personalconfig conf ssh keys

install: ssh conf

serverconfig: install
	install sshd_conf -D ${ETC}/sshd_config

personalconfig: keys
	install authorized_hosts -D ${HOM}/.ssh/autorized_hosts
	install config -D ${HOM}/.ssh
		
conf: personalconfig serverconfig
		
ssh: 
	-pkg install -y -q	openssh mosh sshpass

keys: install
	ssh-keygen 
			
