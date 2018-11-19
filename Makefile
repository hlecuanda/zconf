
SHELL= zsh
ECHO = print -P '%B %s %b'
TITL = print -P '%F{blue}%s%f\n'
GCFWRULES = gcloud compute firewall-rules
FWNAME = ens-in
STARTMSG = echo "Figuring out my IP" 1>&2
DONE = echo "...Done!"
DOGETIP = curl -s mezaops.appspot.com/knock/ | jq .ip 
OLDRANGES = $(GCFWRULES) describe $(FWNAME) --format=json
GETOLDRANGES = $(OLDRANGES)| jw .sourceRanges
MYIP = $(STARTMS) && $(DOGETIP) && $(DONE)
DNSPROJ = lecuanda-domain-management
GDNS = gcloud --project=$(DNSPROJ) dns record-sets transaction
DNSOPT = --type=A --ttl=300
ZONE= --zone mcpaints-public
AWK = gawk -p

HOSTNAME !=hostname
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

help::
	@$(TITL) "Cloud Firewall"
	@cat Makefile             |  \
		$(AWK) '/#2/ && !/AWK/ { gsub(/#2/,"-"); print  $0  }' \
		| sort

whatismyip:  #2 Show your current external IP
	@$(TITL) "Current IP outside"
	@$(DOGETIP)

createfw:    #2 Creates a firewall for the current ip
	@typeset myip=$(MYIP) && \
	$(GCFWRULES) create $(FWNAME) --direction=INGRESS --priority=850 --network=default --action=ALLOW --rules=tcp:22,tcp:531,udp:5353,udp:60000-61000 --source-ranges=$$(myip) --target-tags=bastion

listfw:      #2 Lisrs the projects firewalls
	$(GCFWRULES) list

describefw:  #2 describes this firewall
	$(GCFWRULES) describe $(FWNAME)

deletefw:    #2 deletes this firewall
	-$(GCFWRULES) delete $(FWNAME)

updatefw: deleteFirewall createFirewall

addfw: disabled
	oldranges = $(GETOLDRANGES)
	$(GCFWRULES) update $(FWNAME) --source-ranges=$(OLDRANGES)

