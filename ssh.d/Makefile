
SHELL = zsh
MV    = command mv -v
OS   != uname -o

ifeq "$(OS)" "Android"
PFX      = /data/data/com.termux/files
ETC      = ${PFX}/usr/etc
PKGINSTL = pkg install -y -q
PKGS     = openssh mosh
endif

ifeq "$(OS)" "GNU/Linux"
PFX      = /usr/local
ETC      = /etc/ssh
PKGINSTL = sudo apt-get install -y -q
PKGS     = ssh mosh
endif
	
ifeq "$(OS)" "FreeBSD"
PFX      = /usr/local
ETC      = $(PFX)/etc/ssh
PKGINSTL = sudo pkg install
PKGS     = mosh
endif

UCF         = $(HOME)/.ssh/config
HOSTALIAS  != which ssh-argv0
HATGT      != for host in $$(cat $(UCF) | grep -Ee 'Host '| grep -vEe '\*' | sed -Ee 's/Host//'); \
				echo $(HOME)/bin/$${host}

.PHONY: install binalias server-cfg user-cfg pkg-install

install: user-cfg binalias

pkg-install:
	-$(PKGINSTL) $(PKGS)

binalias: $(HATGT)

user-cfg: $(UCF)

# server-cfg: $(ETC)/sshd_config

# ${ETC}/sshd_config:
#     install sshd_conf

$(HATGT): user-cfg
	[[ ! -f $@  ]] && ln -s $(HOSTALIAS) $@ || :

$(UCF):
	install -T config $@

