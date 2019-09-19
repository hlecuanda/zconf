
SHELL = zsh
RM = rm -fv
.PHONY: display clean

display: server-1.pdf
	xdg-open $<

server-1.xkb:
	xkbcomp -xkb :1 $@

server-1.xkm: server-1.xkb
	xkbcomp -xkm $< $@

server-1.eps: server-1.xkm
	xkbprint -fit -label symbols -pict all $< -o $@

server-1.pdf: server-1.eps
	ps2pdf $< $@


clean:
	-rm *.eps *.xkm *.pdf

