from hlecuanda/prezto-dev as base
# need to have at least zsh make and curl

ENV ZDOTDIR ~/.zconf
RUN adduser --quiet testuser --shell $(which zsh)
USER testuser
WORKDIR /home/testuser/.zconf
ADD . .

ENTRYPOINT ["docker-init","zsh","-l"]


