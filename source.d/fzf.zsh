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
  # typeset -x FZF_CTRL_R_OPTS=
  typeset -x FZF_CTRL_T_COMMAND=
  typeset -x FZF_CTRL_T_OPTS="--preview='scope {} || tree -C {}' --preview-window=right:45% --ansi "
  typeset -x FZF_TMUX=1
  typeset -x FZF_DEFAULT_OPTS="-e --preview='scope {} || tree -C {}' --preview-window=right:45% --ansi --inline-info --border --layout reverse --height 40%"
  typeset -x FZF_TMUX_HEIGHT='60%'

  # Auto-completion
  [[ $- == *i* ]] && source "/home/hector/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

  # Key bindings
  source "/home/hector/.vim/bundle/fzf/shell/key-bindings.zsh"
}
#  d(-_-;)bm  hlo.mx 1579750309
#  vim:  wrap et :
