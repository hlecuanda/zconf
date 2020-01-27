#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_
#  / __/ / /_/ __/
# /_/   /___/_/-unufied setup
#
if [[ ! "$PATH" == */home/hector/.vim/bundle/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/hector/.vim/bundle/fzf/bin"
fi

if [[ true ]]  {
# if (( $+commands[fzf] )) {

  # Main options
  # typeset -x FZF_ALT_C_COMMAND=
  # typeset -x FZF_ALT_C_OPTS=
  # typeset -x FZF_COMPLETION_OPTS
  # typeset -x FZF_COMPLETION_TRIGGER
  typeset -x FZF_CTRL_T_COMMAND=
  typeset -x FZF_CTRL_T_OPTS="--preview='scope {} || tree -C {}' --preview-window=wrap:right:45% --ansi "
  typeset -x FZF_TMUX=1
  typeset -x FZF_DEFAULT_OPTS="-e --preview='scope {} || tree -C {}' --preview-window=wrap:right:45% --ansi --inline-info --border --layout reverse --height 40%"
  typeset -x FZF_TMUX_HEIGHT='60%'

  # Auto-completion
  [[ $- == *i* ]] && source "/home/hector/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null


  # Key bindings
  # ------------
  if [[ $- == *i* ]]; then

    # CTRL-T - Paste the selected file path(s) into the command line
    __fsel() {
      local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
        -o -type f -print \
        -o -type d -print \
        -o -type l -print 2> /dev/null | cut -b3-"}"
      setopt localoptions pipefail no_aliases 2> /dev/null
      eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
        echo -n "${(q)item} "
      done
      local ret=$?
      echo
      return $ret
    }

    __fzf_use_tmux__() {
      [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ]
    }

    __fzfcmd() {
      __fzf_use_tmux__ &&
        echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
    }

    fzf-file-widget() {
      LBUFFER="${LBUFFER}$(__fsel)"
      local ret=$?
      zle reset-prompt
      return $ret
    }
    zle     -N   fzf-file-widget
    bindkey '^T' fzf-file-widget

    # Ensure precmds are run after cd
    fzf-redraw-prompt() {
      local precmd
      for precmd in $precmd_functions; do
        $precmd
      done
      zle reset-prompt
    }
    zle -N fzf-redraw-prompt

    # ALT-C - cd into the selected directory
    fzf-cd-widget() {
      local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
        -o -type d -print 2> /dev/null | cut -b3-"}"
      setopt localoptions pipefail no_aliases 2> /dev/null
      local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
      if [[ -z "$dir" ]]; then
        zle redisplay
        return 0
      fi
      cd "$dir"
      unset dir # ensure this doesn't end up appearing in prompt expansion
      local ret=$?
      zle fzf-redraw-prompt
      return $ret
    }
    zle     -N    fzf-cd-widget
    bindkey '\ec' fzf-cd-widget

    # CTRL-R - Paste the selected command from history into the command line
    autoload fzf-fc
    zle -N   fzf-fc
    bindkey '^R' fzf-fc

  fi
}
#  d(-_-;)bm  hlo.mx 1579750309
#  vim:  wrap et :
