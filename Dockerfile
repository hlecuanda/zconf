FROM continuumio/miniconda2

# install gcc and common build dependencies
RUN apt-get update     \
 && apt-get install -y \
      build-essential  \
      zsh              \
      vim-nox          \
      curl

WORKDIR /zconf

RUN curl -L https://hlo.mx/zconf
