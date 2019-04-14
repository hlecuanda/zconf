FROM debian:stretch
FROM zshusers/zsh-5.3.1
# need to have at least zsh make and curl

ENV ZDOTDIR ~/.zconf
RUN adduser --quiet testuser --shell $(which zsh)
USER testuser
WORKDIR /home/testuser/.zconf
ADD . .
RUN pwd


ENTRYPOINT ["docker-init","zsh","-l"]


