#
# Executes commands at login post-zshrc.
#
# Authors:
  # Sorin Ionescu <sorin.ionescu@gmail.com>


# Execute code that does not affect the current session in the background. # {{{
 {
  # trap 'logger -p user.debug -s $(print -P "%y:%I dir:%~ %N(%i) [%x(%I)]") &>>! ~zconf/logs.d/zcompile.log ' DEBUG

  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi

  #
  # autoload -Uz zrecompile # gets called on compinit
  # bashcompinit          # dunno if needed
  # comprefresh             # gets loaded on UserFunctions

  # trap - DEBUG
} &!
# }}}

#
# Execute code only if STDERR is bound to a TTY. {{{
[[ -o INTERACTIVE && -t 2 ]] && {
  # Print a random, hopefully interesting, adage. {{{
  if (( $+commands[fortune] && $+commands[toilet] && $+commands[boxes] )); then
    unfunction fortune
    # fortune -a 
    # boxes -d utf8 
    # toilet -f term -F metal 
  else 
    # fortune -a
  fi
  # }}}
  # {{{ debugging control
    if [[ -f "${HOME}/.debug" ]] ; then
      unsetopt xtrace verbose
      rm -f "${HOME}/.debug"
    fi
  # }}}
} >&2
# }}}
#  vim: set ft=zsh sw=2 tw=0 fdm=marker et :
