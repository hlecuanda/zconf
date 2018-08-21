

CURL = curl -Ss
WIMIP = https://mezaops.appspot.com/knock/
JQ= jq .ip
MYIP != $(CURL) $(WIMIP) | $(JQ)

.PHONY: open describe list

include Firewall.mk
