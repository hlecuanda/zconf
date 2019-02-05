#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Hector Lecuanda <h@h-lo.me> 20190130 175207 +0000 GMT 1548870727 d(-_- )b...
#   Sorin Ionescu <sorin.ionescu@gmail.com>

# Browser
[[ "$OSTYPE" == darwin* ]] && export BROWSER='open'
#TODO: OS detection from .zshenv

# Editors
[[ $+DISPLAY -ne 0 ]] && export EDITOR='gvim' || export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'

# Language
[[ -z "$LANG" ]] && export LANG='en_US.UTF-8'
unset LC_ALL
export LC_COLLATE=C

# Paths
# Set the list of directories that cd searches.
cdpath=(
  ~
  ~/src
  /opt
  /usr/local/share
  /usr/share
  $cdpath
)
# makes dirs in cdpath callable as ~dir
for dir in $cdpath
  [[ -d $dir ]] && typeset "${dir:t}"="${dir}" 2>&1 >/dev/null

typeset zconf=${ZDOTDIR:-$HOME}

#add gcp path definitions to normal path
[[ -s "${GCPSDK}/path.inc.zsh" ]] &&  source ${GCPSDK}/path.inc.zsh
unset gp

# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  ~/anaconda3/bin
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

# Less
READNULLCMD=${PAGER:-/usr/bin/pager}

typeset -x zls_colours # in addition to module zsh/complist

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -M -R -S -w -z-2'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
#TODO: write a reasonable lessfilter

# Tmpfile specs
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi
typeset -x TMPPREFIX="${TMPDIR%/}/zsh"

#  vim: set ft=zsh sw=4 tw=0 fdm=marker foldlevel=0 et :
