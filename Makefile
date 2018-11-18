
SHELL = zsh
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

HOSTNAME !=hostname
.PHONY: help createfw listfw describefw updatefw deletefw whatismyip

help:        ## Show this message:wq
	@echo ""Make targets:""
	@grep -e '##' Makefile

setdns:      ## set this host DNS
	$(GDNS) start $(ZONE)
	$(GDNS) remove --name=$(HOSTNAME) $(ZONE) $(DNSOPT)
	$(GDNS) add --name=$(HOSTNAME) --data=$(MYIP) $(ZONE)
	$(GDNS) describe $(ZONE)
	$(GDNS) execute $(ZONE)

abdns:       ## abort a transaction
	-$(GDNS) abort $(ZONE)

whatismyip:  ## Show your current external IP
	@echo 
	@$(DOGETIP)

createfw:    ## Creates a firewall for the current ip
	@typeset myip=$(MYIP) && \
	$(GCFWRULES) create $(FWNAME) --direction=INGRESS --priority=850 --network=default --action=ALLOW --rules=tcp:22,tcp:531,udp:5353,udp:60000-61000 --source-ranges=$$(myip) --target-tags=bastion

listfw:      ## Lisrs the projects firewalls
	$(GCFWRULES) list

describefw:  ## describes this firewall
	$(GCFWRULES) describe $(FWNAME)

deletefw:    ## deletes this firewall
	-$(GCFWRULES) delete $(FWNAME)

updatefw: deleteFirewall createFirewall

addfw: disabled
	oldranges = $(GETOLDRANGES)
	$(GCFWRULES) update $(FWNAME) --source-ranges=$(OLDRANGES)

