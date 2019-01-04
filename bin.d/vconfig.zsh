#!/usr/bin/env zsh

OLDCWD=$(pwd)
cd ~/.zconf/vim.d
gvim *
git add .
git commit -m "Autocommit on $(date +%Y%m%d-%h%M)"
cd $OLDCWD


#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
