
# Variables{{{
AWK           = gawk
DNSOPT        = --type=A --ttl=300
ECHO          = print -P '%B %s %b'
FWRULES       = --rules=tcp:22,tcp:631,udp:5353,udp:60000-61000
GCFWRULES     = gcloud compute firewall-rules
HOSTNAME     != hostname
MYIP         = $(shell curl -4 ifconfig.co )
# MYIP         != curl -s https://mezaops.appspot.com/knock/ | jq .ip
SHELL         = zsh
TITL          = print -P '%F{blue}%s%f\n'
VMPARAMS      = --direction=INGRESS --priority=850 --network=default
VMPARAMS     += --action=ALLOW --target-tags=bastion
ZONE          = --zone mcpaints-public

OLDRANGES     = $(GCFWRULES) describe $(FWNAME) --format=json
GETOLDRANGES  = $(OLDRANGES)| jw .sourceRanges

DNSPROJ       = lecuanda-domain-management
GDNS          = gcloud --project= $(DNSPROJ) dns record-sets transaction
# }}}
ifdef TERMUX
CURL       = /data/data/com.termux/files/usr/bin/curl -s
TITL       = echo
else
TITL       = print -P '%F{blue}%s%f\n'
CURL       = curl -s
endif
AWK        = gawk -p
DNSOPT     = --type=A --ttl=300
ECHO       = print -P '%B %s %b'
FWRULES    = --rules=tcp:22,tcp:631,udp:5353,udp:60000-61000
GCFWRULES  = gcloud compute firewall-rules
HOSTNAME  != hostname
MYIP      != $(CURL) -4 ifconfig.co
SHELL      = zsh
VMPARAMS   = --direction=INGRESS --priority=850 --network=default
VMPARAMS  += --action=ALLOW --target-tags=bastion
ZONE       = --zone mcpaints-public# }}}

OLDRANGES = $(GCFWRULES) describe $(FWNAME) --format=json
GETOLDRANGES = $(OLDRANGES)| jw .sourceRanges

DNSPROJ = lecuanda-domain-management
GDNS = gcloud --project=$(DNSPROJ) dns record-sets transaction

.SUFFIXES=
.PHONY: help createfw listfw describefw updatefw deletefw whatismyip

# Help generation headers  {{{
help::        # Show this message:wq
	@figlet Makecloud
	@$(TITL) 'Cloud tasks automation '

help::
	@$(TITL) 'Cloud DNS Services'
	@cat Makefile             |      \
		$(AWK) '/#1/ && !/AWK/ { gsub(/#1/,"-"); print  $0  }' \
		| sort
	# }}}
# DNS Rules  {{{
setdns:      #1 set this host DNS
	$(GDNS) start $(ZONE)
	$(GDNS) remove --name=$(HOSTNAME) $(ZONE) $(DNSOPT)
	$(GDNS) add --name=$(HOSTNAME) --data=$(MYIP) $(ZONE)
	$(GDNS) describe $(ZONE)
	$(GDNS) execute $(ZONE)

abdns:       #1 abort a transaction
	-$(GDNS) abort $(ZONE)
# }}}
# Firewall Related rules{{{
help::   # {{{
	@$(TITL) "Cloud Firewall"
	@cat Makefile             |  \
		$(AWK) '/#2/ && !/AWK/ { gsub(/#2/,"-"); print  $0  }' \
		| sort
# }}}
# Aliases {{{
dsfw: describefw ;

lsfw: listfw ;

mkfw: createfw ;

rmfw: deletefw ;

upfw: updatefw ;

updatefw: cycle ;

fw-ens: mkens ;

fw-alcazar: mkalcazar ;

# }}}
# frequent targets# {{{

movil: FWNAME=movil
movil: cycle

mkens: FWNAME=ens-main
mkens: cycle

rmens: FWNAME=ens-main
rmens: rmfw

mkalcazar: FWNAME=ens-alcazar
mkalcazar: cycle

rmalcazar: FWNAME=ens-alcazar
rmalcazar: rmfw


cycle:: rmfw
cycle:: mkfw

whatismyip:  #2 Show your current external IP
	@$(TITL) "Current IP outside "
	@$(ECHO) $(MYIP)
	-@sleep 60

createfw:    #2 Creates a firewall for the current ip
	@$(TITL) "Creating mobile firewall" 
	@$(GCFWRULES) create $(FWNAME) $(FWPARAMS) \
		$(VMPARAMS) $(FWRULES) --source-ranges=$(MYIP)

listfw:      #2 Lists the projects firewalls
	@$(TITL) "Listing curent firewall rules" 
	@$(GCFWRULES) list

describefw:  #2 describes this firewall
	@$(GCFWRULES) describe $(FWNAME)

deletefw:    #2 deletes this firewall
	-$(GCFWRULES) delete --quiet $(FWNAME)

updatefw:: rmfw ;  # firewall refresh
updatefw:: mkfw ;
	@$(TITL) "Clearing old rules... (this may take a minute...)" 
	-@$(GCFWRULES) delete --quiet $(FWNAME)


# }}}

#  vim: set ft=make sw=4 tw=0 fdm=marker noet :
