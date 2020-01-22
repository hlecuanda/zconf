#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_
#  / __/ / /_/ __/
# /_/   /___/_/-unufied setup
#
trap - INT ERR ZERR USR1 USR2

export FZF_BIN="/home/hector/.vim/bundle/fzf/bin"
if [[ ! "$path" =~ ".*$FZF_BIN.*" ]] {
  path=( $path $FZF_BIN )
  builtin rehash
}

if (( true )) {
# if (( $+commands[fzf] )) {

#   # Main options
#   # # ###
#   typeset -x scope='--preview scope {} || tree -C {}'
#   # typeset -x FZF_ALT_C_COMMAND=
#   # typeset -x FZF_ALT_C_OPTS=
#   # typeset -x FZF_COMPLETION_OPTS
#   # typeset -x FZF_COMPLETION_TRIGGER
#   # typeset -x FZF_CTRL_R_OPTS=
#   # typeset -x FZF_CTRL_T_COMMAND=
#   # typeset -x FZF_CTRL_T_OPTS=$scope
#   typeset -x FZF_TMUX=1
#   typeset -x FZF_DEFAULT_OPTS="-e $scope --preview-window=right:45% --ansi --inline-info --border --layout reverse --height 40%"
#   typeset -x FZF_TMUX_HEIGHT='60%'
# # #..

# Completion:
# ###
# To use custom commands instead of find, ###
if ! declare -f _fzf_compgen_path > /dev/null; then
  _fzf_compgen_path() {
    echo "$1"
    command find -L "$1" \
      -name .git -prune -o -name .hg -prune -o -name .svn \
      -prune -o \( -type d -o -type f -o -type l \) \
      -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
  }
fi

if ! declare -f _fzf_compgen_dir > /dev/null; then
  _fzf_compgen_dir() {
    command find -L "$1" \
      -name .git -prune -o -name .hg -prune -o -name .svn -prune -o -type d \
      -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
  }
fi

# Use fd (https://github.com/sharkdp/fd) instead of the default find###
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.

  # _fzf_compgen_path() {
  #   fd --hidden --follow --exclude ".git" . "$1"
  # }

# Use fd to generate the list for directory completion

  # _fzf_compgen_dir() {
  #   fd --type d --hidden --follow --exclude ".git" . "$1"
  # }

# #..

# #..
# Private funcs ###

__fzfcmd_complete() { # ###
 [[  ( -n "$TMUX_PANE" ) && ( "${FZF_TMUX:-0}" != 0 )  && ( ${LINES:-40} -gt 15 )  ]] \
   && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}  # #..

__fzf_generic_path_completion() {  # ###
local base lbuf compgen fzf_opts suffix tail fzf dir leftover matches
base=$1
lbuf=$2
compgen=$3
fzf_opts=$4
suffix=$5
tail=$6
fzf="$(__fzfcmd_complete)"

  setopt localoptions nonomatch
  eval "base=$base"
  [[ $base = *"/"* ]] && dir="$base"
  while true
  do
    if [[ -z "$dir" || -d $dir ]] then
      leftover=${base/#"$dir"}
      leftover=${leftover/#\/}
      [[ -z "$dir" ]] && dir='.'
      [[ "$dir" != "/" ]] && dir="${dir/%\//}"
      matches=$(eval "$compgen $(printf %q "$dir")" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_COMPLETION_OPTS" ${=fzf} ${=fzf_opts} -q "$leftover" | while read item; do
        echo -n "${(q)item}$suffix "
      done)
      matches=${matches% }
      if [[ -n "$matches" ]] then
        LBUFFER="$lbuf$matches$tail"
      fi
      zle reset-prompt
      break
    fi
    dir=$(dirname "$dir")
    dir=${dir%/}/
  done
}  # #..

# #..
# Helper funca  ###
_fzf_path_completion() {  # ###
  __fzf_generic_path_completion "$1" "$2" _fzf_compgen_path \
    "-m" "" " "
}  # #..

_fzf_dir_completion() { # ###
  __fzf_generic_path_completion "$1" "$2" _fzf_compgen_dir \
    "" "/" ""
} # #..

_fzf_feed_fifo() (  # ###
  command rm -f "$1"
  mkfifo "$1"
  cat <&0 > "$1" &
)  # #..

_fzf_complete() {  # ###
  local fifo fzf_opts lbuf fzf matches post
  fifo="${TMPDIR:-/tmp}/fzf-complete-fifo-$$"
  fzf_opts=$1
  lbuf=$2
  post="${funcstack[2]}_post"
  type $post > /dev/null 2>&1 || post=cat#

  fzf="$(__fzfcmd_complete)"

  _fzf_feed_fifo "$fifo"
  matches=$(cat "$fifo" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_COMPLETION_OPTS" ${=fzf} ${=fzf_opts} -q "${(Q)prefix}" | $post | tr '\n' ' ')
  if [[ -n "$matches" ]] then
    LBUFFER="$lbuf$matches"
  fi
  zle reset-prompt
  command rm -f "$fifo"
} #..

_fzf_complete_telnet() {  # ###
  _fzf_complete '+m' "$@" < <(
    command grep -v '^\s*\(#\|$\)' /etc/hosts | command grep -Fv '0.0.0.0' |
        awk '{if (length($2) > 0) {print $2}}' | sort -u
  )
}  # #..

_fzf_complete_ssh() {  # ###
  _fzf_complete '+m' "$@" < <(
    setopt localoptions nonomatch
    command cat <(cat ~/.ssh/config ~/.ssh/config.d/* /etc/ssh/ssh_config 2> /dev/null | command grep -i '^\s*host\(name\)\? ' | awk '{for (i = 2; i <= NF; i++) print $1 " " $i}' | command grep -v '[*?]') \
        <(command grep -oE '^[[a-z0-9.,:-]+' ~/.ssh/known_hosts | tr ',' '\n' | tr -d '[' | awk '{ print $1 " " $1 }') \
        <(command grep -v '^\s*\(#\|$\)' /etc/hosts | command grep -Fv '0.0.0.0') |
        awk '{if (length($2) > 0) {print $2}}' | sort -u
  )
}  # #..

_fzf_complete_export() {  # ###
  _fzf_complete '-m' "$@" < <(
    declare -xp | sed 's/=.*//' | sed 's/.* //'
  )
}  # #..

_fzf_complete_unset() {  # ###
  _fzf_complete '-m' "$@" < <(
    declare -xp | sed 's/=.*//' | sed 's/.* //'
  )
}  # #..

_fzf_complete_unalias() {  # ###
  _fzf_complete '+m' "$@" < <(
    alias | sed 's/=.*//'
  )
}  # #..

# #..
fzf-completion() { # ###
  local tokens cmd prefix trigger tail fzf matches lbuf d_cmds
  setopt localoptions noshwordsplit noksh_arrays noposixbuiltins

  # http://zsh.sourceforge.net/FAQ/zshfaq03.html
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
  tokens=(${(z)LBUFFER})
  if [[ $#tokens -lt 1 ]] then
    zle ${fzf_default_completion:-expand-or-complete}
    return
  fi

  cmd=$tokens[1]

  # Explicitly allow for empty trigger.
  trigger=${FZF_COMPLETION_TRIGGER-'**'}
  [ -z "$trigger" -a $LBUFFER[-1] = ' ' ] && tokens+=("")

  # When the trigger starts with ';', it becomes a separate token
  if [[ $LBUFFER = *"$tokens[-2]$tokens[-1]" ]] then
    tokens[-2]="$tokens[-2]$tokens[-1]"
    tokens=($tokens[0,-2])
  fi

  tail=${LBUFFER:$(( $#LBUFFER - $#trigger ))}
  # Kill completion (do not require trigger sequence)
  if [[ $cmd = kill -a $LBUFFER[-1] = ' ' ]] then
    fzf="$(__fzfcmd_complete)"
    matches=$(command ps -ef | sed 1d | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-50%} --min-height 15 --reverse $FZF_DEFAULT_OPTS --preview 'echo {}' --preview-window down:3:wrap $FZF_COMPLETION_OPTS" ${=fzf} -m | awk '{print $2}' | tr '\n' ' ')
    if [[ -n "$matches" ]] then
      LBUFFER="$LBUFFER$matches"
    fi
    zle reset-prompt
  # Trigger sequence given
  elif [[ $#tokens -gt 1 -a "$tail" = "$trigger" ]] then
    d_cmds=(${=FZF_COMPLETION_DIR_COMMANDS:-cd pushd rmdir})

    [[ -z "$trigger"      ]] && prefix=$tokens[-1] || prefix=${tokens[-1]:0:-$#trigger}
    [[ -z "$tokens[-1]" ]] && lbuf=$LBUFFER        || lbuf=${LBUFFER:0:-${#tokens[-1]}}

    if eval "type _fzf_complete_$cmd > /dev/null"; then
      eval "prefix=\"$prefix\" _fzf_complete_$cmd \"$lbuf\""
    elif [[ ${d_cmds[(i)$cmd]} -le $#d_cmds ]] then
      _fzf_dir_completion "$prefix" "$lbuf"
    else
      _fzf_path_completion "$prefix" "$lbuf"
    fi
  # Fall back to default completion
  else
    zle ${fzf_default_completion:-expand-or-complete}
  fi
}
# #..
#Binding ###
if [[ -z "$fzf_default_completion" ]]  then
  binding=$(bindkey '^I')
  [[ $binding =~ 'undefined-key' ]] || fzf_default_completion=$binding[(s: :w)2]
  unset binding
fi

zle     -N   fzf-completion
bindkey '^I' fzf-completion
# #..

# #..

# Bindings  # ###

# CTRL-T - Paste the selected file path(s) into the command line###
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
}  # #..


__fzfcmd() {  # ###
  [[ ( -n "$TMUX_PANE" ) && ( "${FZF_TMUX:-0}" != 0 ) && ( ${LINES:-40} -gt 15 ) ]] \
    && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" \
    || echo "fzf"
}  # #..

fzf-file-widget() {  # ###
  LBUFFER="$LBUFFER$(__fsel)"
  local ret=$?
  zle reset-prompt
  return $ret
}  # #..

# Ensure precmds are run after cd###
fzf-redraw-prompt() {
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done
  zle reset-prompt
}  # #..

# ALT-C - cd into the selected directory###
fzf-cd-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]] then
    zle redisplay
    return 0
  fi
  cd "$dir"
  unset dir # ensure this doesn't end up appearing in prompt expansion
  local ret=$?
  zle fzf-redraw-prompt
  return $ret
}  # #..

# CTRL-R - Paste the selected command from history into the command line###
fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(fc -rl 1 |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
  local ret=$?
  if [[ -n "$selected" ]] then
    num=$selected[1]
    if [[ -n "$num" ]] then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}  # #..

# Binding  # ###
bindkey '\C-R'     fzf-history-widget
bindkey '\C-X\C-C' fzf-cd-widget
bindkey '^T'       fzf-file-widget
zle     -N         fzf-cd-widget
zle     -N         fzf-file-widget
zle     -N         fzf-history-widget
zle -N fzf-redraw-prompt
# #..

# #..

}
#  d(-_-;)bm  hlo.mx 1579687849
#  vim:  tw=70 fdm=marker fmr=###,#.. wrap et :
