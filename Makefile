

CURL = curl -Ss
WIMIP = https://mezaops.appspot.com/knock/
JQ= jq .ip
MYIP != $(CURL) $(WIMIP) | $(JQ) | sed -e 's/"//g'

		

include Firewall.mk

