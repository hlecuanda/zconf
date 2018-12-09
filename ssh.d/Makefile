
SHELL=zsh
MV = command mv -v
OS != uname -o

ifeq "$(OS)" "Android"
PFX=/data/data/com.termux/files
ETC=${PFX}/usr/etc
else 
PFX=/usr/local
ETC=${PFX}/etc
endif
	
UCF=$(HOME)/.ssh/config
HOSTALIAS != which ssh-argv0

HATGT != for host in $$(cat $(UCF) | grep -Ee 'Host '| grep -vEe '\*' | sed -Ee 's/Host//'); \
		echo $(HOME)/bin/$${host}

.PHONY: install binalias server-cfg user-cfg


install: server-cfg user-cfg
	-apt install -y -q openssh mosh sshpass

ifdef $(HOSTALIAS)
binalias: $(HATGT)

$(HATGT): user-cfg
	grep $(nodir $@) $(UCF)
endif

server-cfg: $(ETC)/sshd_config

user-cfg: $(UCF)

${ETC}/sshd_config:
	install sshd_conf

$(UCF):
	install config

