SHELL = zsh
BADENV = $(error "Define ZFUNC")

include fpath.mk

ifndef ZFUNC
all: ; $(BADENV)
else
all: test
endif

install: ;

.ONESHELL: test

test:
	fpath=($$fpath $(FPATH))
	autoload $(ZFUNC)
	$(ZFUNC)



#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
