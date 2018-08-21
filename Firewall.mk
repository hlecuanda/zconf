
FWRULES	 gcloud compute firewall-rules
CREATE = $(FWRULES) create 
DESCRIBE = $(FWRULES) describe
LIST   = $(FWRULES) list
ALLOW  = --action=ALLOW
IN     = --direction=INGRESS
IN    += --source-ranges=$(WIMIP)/32
IN    += --target-tags=bastion
OUT    = --direction=EGRESS
OUT   += --source-tags=bastion
OUT   += --destination-ranges=$(WIMIP)/32
PARAM  = --network="default" --priority=900
RULES  = --rules=tcp:22,udp:60000-61000

create:
	@$(CREATE) ssh-allow-in  $(ALLOW) $(IN)  $(RULES) $(PARAM)
	@$(CREATE) ssh-allow-out $(ALLOW) $(OUT) $(RULES) $(PARAM)

describe:
	@$(DESCRIBE) ssh-allow-in
	@$(DESCRIBE) ssh-allow-out

list:
	@$(LIST)


delete:
