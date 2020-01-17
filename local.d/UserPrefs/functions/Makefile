SHELL = zsh
UNINSTALLED != ls *.zsh

TOGGLE_X = [[ -o xtrace   ]] && unsetopt xtrace  || setopt xtrace
TOGGLE_V = [[ -o verbose  ]] && unsetopt verbose || setopt verbose

ifndef TESTFUNCS
TF := $(shell $(READVAR))
endif

ifdef TF
$(MAKECMDGOALS):
	TESTFUNCS=$(TF) $(MAKE) $(MAKECMDGOALS)
endif


define READVAR
PROMPT3="Script to work on?"
select script in $(UNINSTALLED)
do
  echo "$$script"
  break;
done
endef

define TEST
		@(( $$functions[$<] )) &&  unfunction $< || :
		@autoload $<
		@[[ -n "$(ZFUNCARGS)"  ]] && legend="With args $(ZFUNCARGS)" || :
		@print  Testing $< $$legend
		@$(DEBUGCMD) $(VERBOSE) $< $(ZFUNCARGS)
		@$(UNVERBOSE)
		@$(UNDEBUG)
endef
install:

.SUFFIXES:
.SUFFIXES: .zsh

.IGNORE: test continuous

.PHONY: debug test install verbose continuous

.ONESHELL: test continuous

ifdef TESTFUNCS
debug: DEBUGCMD = zsh -x
debug: UNDEBUG = $(TOGGLE_X)
debug: test

verbose:VERBOSE = -o verbose
verbose:UNVERBOSE = $(TOGGLE_V)
verbose: debug

continuous: %.zsh: $(TESTFUNCS)
	() {
	  function cycle {
	    setopt localoptions localtraps
		trap '$(TOGGLE_X)' USR1
		trap '$(TOGGLE_V)' USR2
	    while true
		do
		{
		  $(TEST)
		  delay 1
		} always {
		  TRY_BLOCK_ERROR=0
		  delay 5
		}
		done
	  }
	  cycle
	}

test: %.zsh: $(TESTFUNCS)
	$(TEST)

%: %.zsh: $(TESTFUNCS)
	install -m 755 $< $@

%.zsh:
	@echo in zsh for $<

%: ;
	@echo last resort for $<

endif
#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
