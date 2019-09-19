# Setup fzf
# ---------

typeset fzfpath=~/.vim/bundle/fzf
typeset binf=${fzfpath}/bin

[[ ! "$PATH" == *${binf}* ]] \
  && path=( ${path:+${path}} ${binf} )

[[ ! -z $commands[fzf] ]]&& {

  typeset fzfpath=~/.vim/bundle/fzf
  typeset binf=${fzfpath}/bin
  typeset comp=${fzfpath}/shell/completion.zsh
  typeset bind=${fzfpath}/shell/key-bindings.zsh

  function fzf () {
    [[ -v TMUX ]] && $commands[fzf-tmux] "$@" || $commands[fzf] "$@"
  }
   # Auto-completion
  [[ -s ${comp} ]] \
    && { [[ $- == *i* ]] && source "${comp}" 2> /dev/null }
   # Key bindings
  [[ -s ${bind} ]] \
    && { source "${bind}" }

  get_execs="fselect path from / where user_exec = true 2&> /dev/null"
  # executables="$(get_execs) | fzf"

  export FZF_DEFAULT_OPTS='-e --preview-window=right:45% --ansi --inline-info --border --layout reverse --height 40%'
  # export FZF_COMPLETION_TRIGGER='~~' # Use ~~ as the trigger sequence instead of the default **
  export FZF_COMPLETION_OPTS='+c -x'
  export FZF_CTRL_T_COMMAND= # FZF_CTRL_T_COMMAND to override the default command
  export FZF_CTRL_T_OPTS="--preview 'scope {} || tree -C {} '"    # Set FZF_CTRL_T_OPTS to pass additional options
  export FZF_CTRL_R_OPTS=    # Set FZF_CTRL_R_OPTS to pass additional options
  export FZF_ALT_C_COMMAND=  # Set FZF_ALT_C_COMMAND to override the default command
  export FZF_ALT_C_OPTS= # FZF_ALT_C_OPTS to pass additional options
  export FZF_TMUX=1          # start fzf in a split pane by setting FZF_TMUX to 1,
  export FZF_TMUX_HEIGHT=60%    # change the height of the pane with FZF_TMUX_HEIGHT (e.g. 20, 50%).
  # Use fd (https://github.com/sharkdp/fd) instead of the default find
  # command for listing path candidates.
  # - The first argument to the function ($1) is the base path to start traversal
  # - See the source code (completion.{bash,zsh}) for the details.
  # _fzf_compgen_path() {
  #   fd --hidden --follow --exclude ".git" . "$1"
  # }

  # # Use fd to generate the list for directory completion
  # _fzf_compgen_dir() {
  #   fd --type d --hidden --follow --exclude ".git" . "$1"
  # }

  } || true

unset binf
unset comp
unset bind
#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
