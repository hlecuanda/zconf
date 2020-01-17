
SHELL       = zsh

SIG        != kill -l
SIG        += ZERR DEBUG
SIGNALS    := $(addsuffix .signal,$(SIG))
FILLEDTMPL := $(addsuffix .zshsrc,$(SIG))
TRAPNALS   := $(addprefix TRAP,$(SIG))


.SUFFIXES:
.SUFFIXES: .zsh .zshsrc .template .signal

.PHONY: blanks default

default: ;

clean:
	-rm -rfv *.zshsrc

blanks: $(FILLEDTMPL)

traps.zsh: *.zshsrc
	for s in $? ;
	do
	  tail -11 $$s \
	   | grep -vF 'function wrapper' \
	   | grep -vF 'vim' \
	   | sed -Ee 's/^./ /' \
	   >>! $@
	  done
	print "\n\n" >>! $@



%.zshsrc: master.template

%.zshsrc: %.signal
	cat master.template \
	 | sed -Ee 's/TRAPNAL/TRAP$(<:.signal=)/' \
	 | sed -Ee 's/\sNAL(\s{5,}#)/ $(<:.signal=)\1/' \
	 > $@



%.signal:
	touch $@

%: ;
