#!/usr/bin/env make -n
#                 _        _
#  _ __ _   _ ___| |_   __| |
# | '__| | | / __| __| / _` |
# | |  | |_| \__ \ |_ | (_| |
# |_|   \__,_|___/\__(_)__,_|
#
# h@h-lo.me 20200123 182603 -0800 PST 1579832763 d(-_- )b...
###                                                                  # ###1

# Over time,i've become used to a few replacement unix utilities written in
# rust that i now find indespensible, and so, henceforth this makefile shall
# make'em and installe'em

# Variables & directives                                           # ###:
# . ..............................................................
SOURCES      = exa fd fselect rg alacritty
# . ..............................................................
SHELL        = zsh
CARGO_BIN   = $(HOME)/.cargo/bin
EXECUTABLES := $(addprefix $(CARGO_BIN)/,$(SOURCES))
# #..
# Special  targets                                                    # ###:
.SUFFIXES:

.IGNORE: clean

.PHONY: default all install clean rustup
# #..
# Phony targets                                                    # ###:
default:  install ;

all:: install

all:: clean

install: $(EXECUTABLES)

clean::
	rm -rfv $(CARGO_BIN)

# #..

.rustup:
	[[ ! -d $(CARGO_BIN) ]] \
	  && curl --proto '=https' \
	          --tlsv1.2 \
	          -sSf https://sh.rustup.rs \
	     | sh \
	  || true
	touch $@

$(EXECUTABLES): .rustup
	@echo $@: $(@F)
	typeset binf="$(@F)" \
	  case $$binf in \
	    rg) typeset instf="ripgrep" ;; \
	    fd) typeset instf="fd-find" ;; \
	     *) typeset instf="$$binf"  ;; \
	  esac \
	cargo install $$instf


# #..
#..
#  d(-_-;)bm  hlo.mx 1578762899
#  vim:  fdl=1 fdm=marker fmr=###,#.. noet :
