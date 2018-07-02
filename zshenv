#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if [[ -f "${HOME}/.debug" ]] ; then
   setopt xtrace sourcetrace
   rm -f "${HOME}/.debug"
fi

if [[ -z ${ZDOTDIR}  ]] ; then 
   typeset -x ZDOTDIR=$HOME/.zconf
fi
if [[ -d /data/data/com.termux ]] ; then
   # were in termuxland
   typeset -x TZ=$(getprop persist.timezone)
   typeset -x TERMUXPREFIX=/data/data/com.termux/files/usr
fi
unsetopt global_rcs
# skip_global_compinit=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
