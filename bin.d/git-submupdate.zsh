#!/usr/bin/env zsh

echo "Updatin submodules properly"

git pull "$@" \
    && git submodule sync --recursive \
    && git submodule update --init --recursive

#  vim: set ft=zsh sw=4 tw=0 fdm=manual et :
