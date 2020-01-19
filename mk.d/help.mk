
define universal help =
paste <(cat Makefile | awk '/^\w+:\s/ {print $$1}' | sort | uniq)
#     <(cat $(MKF) | awk '/^##/ {print $$0}') \
# | awk 'BEGIN {FS="#"};  { printf "%s   %s", $$1 $$3 }'
endef
TARGETCOL = cat Makefile | tr \# , | awk 'BEGIN {FS=":"}; /^.+:\s/  {print $$0 } ' | grep -vEe 'PHONY'| sort | uniq
DESCRPCOL =  cat Makefile | awk 'BEGIN {FS="\#"}; /^\#\s\w.+/  {print $$0}'
.PHONY: help
.ONESHELL: help
SHELL = zsh
help:
	@paste <($(TARGETCOL)) <($(DESCRPCOL))
