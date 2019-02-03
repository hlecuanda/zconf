PIP= pip install --upgrade 
PIP2= pip2 install --upgrade 


.PHONY: install pip packages

install: 
	pkg install python2
	$(PIP) pip
	$(PIP2) pip
	$(PIP) -r requirements.txt
	$(PIP2) -r requirements2.txt
	

