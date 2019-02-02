
# Variables{{{
AWK        = gawk
DNSOPT     = --type=A --ttl=300
ECHO       = print -P '%B %s %b'
FWRULES    = --rules=tcp:22,tcp:631,udp:5353,udp:60000-61000
GCFWRULES  = gcloud compute firewall-rules
HOSTNAME  != hostname
MYIP      != curl -s https://mezaops.appspot.com/knock/ | jq .ip
SHELL      = zsh
TITL       = print -P '%F{blue}%s%f\n'
VMPARAMS   = --direction=INGRESS --priority=850 --network=default
VMPARAMS  += --action=ALLOW --target-tags=bastion
ZONE       = --zone mcpaints-public# }}}

OLDRANGES = $(GCFWRULES) describe $(FWNAME) --format=json
GETOLDRANGES = $(OLDRANGES)| jw .sourceRanges

DNSPROJ = lecuanda-domain-management
GDNS = gcloud --project=$(DNSPROJ) dns record-sets transaction

.PHONY: help createfw listfw describefw updatefw deletefw whatismyip

help::        # Show this message:wq
	@figlet Makecloud
	@$(TITL) 'Cloud tasks automation '

help::
	@$(TITL) 'Cloud DNS Services'
	@cat Makefile             |      \
		$(AWK) '/#1/ && !/AWK/ { gsub(/#1/,"-"); print  $0  }' \
		| sort

setdns:      #1 set this host DNS
	$(GDNS) start $(ZONE)
	$(GDNS) remove --name=$(HOSTNAME) $(ZONE) $(DNSOPT)
	$(GDNS) add --name=$(HOSTNAME) --data=$(MYIP) $(ZONE)
	$(GDNS) describe $(ZONE)
	$(GDNS) execute $(ZONE)

abdns:       #1 abort a transaction
	-$(GDNS) abort $(ZONE)

# Firewall Related rules{{{
help::
	@$(TITL) "Cloud Firewall"
	@cat Makefile             |  \
		$(AWK) '/#2/ && !/AWK/ { gsub(/#2/,"-"); print  $0  }' \
		| sort

whatismyip:  #2 Show your current external IP
	@$(TITL) "Current IP outside "
	@$(ECHO) $(MYIP)

createfw:    #2 Creates a firewall for the current ip
	$(GCFWRULES) create $(FWNAME) $(FWPARAMS) \
		$(VMPARAMS) $(FWRULES) --source-ranges=$(MYIP)

listfw:      #2 Lisrs the projects firewalls
	$(GCFWRULES) list

describefw:  #2 describes this firewall
	$(GCFWRULES) describe $(FWNAME)

rmfw: deletefw

mkfw: createfw

deletefw:    #2 deletes this firewall
	-$(GCFWRULES) delete $(FWNAME)

updatefw: deleteFirewall createFirewall

addfw: disabled
	oldranges = $(GETOLDRANGES)
	$(GCFWRULES) update $(FWNAME) --source-ranges=$(OLDRANGES)
# }}}

#  vim: set ft=make sw=4 tw=0 fdm=marker noet :
