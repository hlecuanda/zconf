#!/usr/bin/env zsh
#          _
#  _______| |__   ___ _ ____   __
# |_  / __| '_ \ / _ \ '_ \ \ / /
#  / /\__ \ | | |  __/ | | \ V /
# /___|___/_| |_|\___|_| |_|\_/
#
# Basic Environment for zsh with debugging provision
# h@h-lo.me 20190110 115942 -0800 PST 1547150382 d(-_- )b...

if [[ -f "${HOME}/.debug" ]] ; then
   setopt xtrace sourcetrace
   # this file gets deleted on completion of .login for
   # interactive shells
fi

if [[ -z ${ZDOTDIR}  ]] ; then
   typeset -x ZDOTDIR=$HOME/.zconf
fi

if [[ -d /data/data/com.termux ]] ; then
   # were in termuxland
   typeset -x TZ=$(getprop persist.timezone)
   typeset -x TERMUXPREFIX=/data/data/com.termux/files/usr
   typeset -x USRLOCAL=$TERMUXPREFIX/local
 else
   typeset -x USRLOCAL=/usr/local
fi

unsetopt global_rcs

# Ensure that a non-login, non-interactive shell has a defined environment.
# Sorin Ionescu <sorin.ionescu@gmail.com>
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
