#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
#TODO: OS detection from .zshenv
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
cdpath=(
  ~
  ~/src
  ~/anaconda3/envs
  /opt
  /usr/local/share
  /usr/share
  $cdpath
)
  # ~/anaconda3/lib/python3.6/site-packages

# makes dirs in cdpath callable as ~dir
for dir in $cdpath
    if [[ -d ${dir} ]]; then
        typeset "${dir:t}"="${dir}" 2>&1 >/dev/null
    else
        #TODO: find a better way to determine unused var
        typeset "${dir:t}2"="${dir}"
    fi

typeset zconf=${ZDOTDIR:-$HOME}


# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  ~/anaconda3/bin
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

# Set the list of directories that Zsh searches for functions.
fpath=(
    ~/src/zsh-completions/src
    ${ZDOTDIR:-HOME}/UserFunctions
    $fpath[@]
)

#
# Less
#

READNULLCMD=${PAGER:-/usr/bin/pager}

typeset -x TZ="/usr/share/zoneinfo/America/Tijuana"
typeset -x zls_colours # in addition to module zsh/complist

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -M -R -S -w -X -z-2'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
#TODO: write a reasonable lessfilter

#
# Tmpfile specs
#
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi
typeset -x TMPPREFIX="${TMPDIR%/}/zsh"

#  vim: set ft=zsh sw=4 tw=0 fdm=marker foldlevel=0 et :
