
FWRULES	= gcloud compute firewall-rules
CREATE = $(FWRULES) create 
DESCRIBE = $(FWRULES) describe
LIST   = $(FWRULES) list
ALLOW  = --action=ALLOW
IN     = --direction=INGRESS
IN    += --source-ranges=$(MYIP)/32
IN    += --target-tags=bastion
OUT    = --direction=EGRESS
OUT   += --destination-ranges=$(MYIP)/32
PARAM  = --network="default" --priority=900
RULES  = --rules=tcp:22,udp:60000-61000

.PHONY: firewall fw-list fw-describe fw-create fw-delete

firewall: fw-list fw-create 

fw-create:
	@$(CREATE) ssh-in  $(ALLOW) $(IN)  $(RULES) $(PARAM)
	@$(CREATE) ssh-out $(ALLOW) $(OUT) $(RULES) $(PARAM)

fw-describe:
	@$(DESCRIBE) ssh-in
	@$(DESCRIBE) ssh-out

fw-list:
	@$(LIST)

fw-delete:

