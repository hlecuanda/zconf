	
PFX=/data/data/com.termux/files
ETC=${PFX}/usr/etc
HOM=${PFX}/home		

.PHONY: install serverconfig personalconfig conf ssh 

install: ssh conf

serverconfig: 
	install sshd_conf -D ${ETC}/sshd_config

personalconfig: $(HOME)/.ssh/id_rsa
	install authorized_hosts -D ${HOM}/.ssh
	install config -D ${HOM}/.ssh
		
conf: personalconfig serverconfig
		
ssh: 
	-pkg install -y -q	openssh mosh sshpass

$(HOME)/.ssh/id_rsa: 
	ssh-keygen 
			
