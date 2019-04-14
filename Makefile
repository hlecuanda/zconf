
ifdef FREEBSD
INSTALL=install -c
else
INSTALL=install -T
endif

DIRS         = etal bin vim zsh
DIRS        += tmux x11
DIRSDOTD     = $(addsuffix .d,$(DIRS))
SHELL        = zsh
ZDOTDIR      = ~/.zconf
INSTALL_DATA = $(INSTALL) -m 644
INSTALL_PROG = $(INSTALL) -m 754
GCLOUD       = $(HOME)/google-cloud-sdk/.hlo

# export INSTALL INSTALL_PROG INSTALL_DATA
# export SHELL

.PHONY: all clean install realclean localtest gcloud modules $(DIRS) $(DIRSDOTD)
.SUFFIXES=

all: ;

localtest:
	cd ~/.zconf/bootstrap.d  && \
	[[ -n "$(ps ax | greo python3 | grep http )" ]] && true || python3 -m http.server 8080 &
	docker build --tag 'zconf:testbox' .
	docker run zconf:testbox
	docker attach
	killall python3

install: $(DIRS) $(GCLOUD)

$(DIRS): %: %.d
	make -C $< install

$(GCLOUD):
	cd ~ && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-241.0.0-linux-x86_64.tar.gz
	cd ~ && tar xf google-cloud-sdk-241.0.0-linux-x86_64.tar.gz
	cd ~ && touch google-cloud-sdk/.hlo

clean:
	-[[ -n "$$(find . -name Xterm.log* -print | head -1 )" ]] && \
		find . -name Xterm.log* -print -delete || true
	-[[ -f ~/google-cloud-sdk-*.tar.gz ]] && \
		rm -v ~/google-cloud-sdk-*.tar.gz || true
	-docker container stop zconf:testbox
	-docker container rm zconf:testbox --force
	-docker image prune -a -f
	# for d in $(addsuffix .d,$(DIRS))\
	#     $(MAKE) -C $$d clean

realclean: clean
	-rm -rf ~/google-cloud-sdk
	-rm -rfv ~/bin


#  vim: set ft=make sw=4 tw=0 fdm=manual noet :
