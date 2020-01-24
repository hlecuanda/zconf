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

# Execute code only if STDERR is bound to a TTY. {{{
[[ -o INTERACTIVE && -t 2 ]] && {
  # fix ordering
  unset LC_ALL
  export LC_COLLATE=C
  # Print a random, hopefully interesting, adage. {{{
  # (( $+commands[fortune] )) && unfunction fortune ; fortune -a
  (( $+commands[thefuck] )) && eval $(thefuck --alias)
  (( $+commands[tig]     )) && typeset -x TIGRC_USER=~/.zconf/git.d/tigrc
  (( $+functions[fzf-cd-widget] )) && bindkey -M viins "\C-X\C-D" fzf-cd-widget

  # }}}
  # {{{ debugging control
    [[ -f "${HOME}/.debug" ]] && {
      unsetopt xtrace verbose
      rm -f "${HOME}/.debug"
    }
  # }}}
} >&2
# }}}
#  d(-_-;)bm  hlo.mx 1579832200
#  vim: set ft=zsh sw=2 tw=0 fdm=marker et :
