	
PFX=/data/data/com.twemux/files
ETC=${PFX}/usr/etc
HOM=${PFX}/home		

.PHONY: install

${ETC}/sshd_config: installserver personalcfg
	install sshd_conf -D ${ETC}/sshd_config

${HOM}/.ssh/.done:
	@install authorized_hosts -D ${HOM}/.ssh/autorized_hosts
	install config -D ${HOM}/.ssh/config
	install id_rs* -D $(HOM}/
		
install: 
	-apt install -y -q	openssh mosh sshpass
			
