#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
# h@h-lo.me 20180219 205525 -0800 PST 1519102525 d(-_- )b...
#
# link to .zshrc
# Executes commands at the start of an interactive session.
#
# Authors:
#   Hector Lecuanda (H-Lo) <h@h-lo.me>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# 0. Vim navigation awesomness                                            # {{{
#
# Add this to your vimrc or paste to your command line to navigate this
# file like a boss
#
# nnoremap <buffer> <CR> <C-]>
# nnoremap <buffer> <BS> <C-T>
# nnoremap <buffer> o /'\l\{2,\}'<CR>
# nnoremap <buffer> O ?'\l\{2,\}'<CR>
# nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
# nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
#
# otherwise, use the vim code-folding kick-assery:
#
#    zo - open fold
#    zc - close fold
#    zR - recursively open folds
#    zC - recursively, aha.. thats it you got it.
#
#    m,nzf - create a fold from line m through n
#    zf - create a fold on visual selection
#
# Note, however that the sheer size of this file and the need for navigation
# shortcut indicate that it is ridiculously long and should be split into
# more manageable pieces. perhaps when i'm not wasting my emplouyer's time
# i'll find time to do so. in the meantime....
#
#                                                                         # }}}
#
# 0. Index                                                               # {{{
#
# 1. Source Prezto, local packages and UserFunctions
#
# 2. Zsh options
#   2.1 Changing dirs
#   2.2 Completion
#   2.3 Globbing
#   2.4 History
#   2.3 CLI Correct
#
# 3. Aliases
#   3.1 Le BSD aliases
#   3.2 MacVim aliases
#   3.3 Global aliases
#   3.4 Suffix aliases
#   3.5 GRC Colorizer (Y u dont have it? go get it! now!)
#   3.6 Personal additions
#
# 4. Keybindings
#   4.1 Dynamic keypad
#   4.2 F-Keys
#   4.3 Incremental search
#   4.4 Command position word historu search
#   4.5 Scroll most recent files
#   4.6 Lat word in previous or current command
#   4.7 Kick-ass swquence triggered bindings
#   4.8 C-Z vim toggle like le old tcsh used to
#   4.9 Personal overrides
#
# 5. Zsh Extras I'm fond of
#   5.1 zsh stycky notes
#   5.2 BSDowl Build system (don't need no stinkin' grunt or gulp)
#   5.3 Moar named dirs besides .zprofile defined tnamed dirs
#
# 6. Completion system overrides
#
#                                                                         # }}}
#
# 6. Compsys styles overrides # {{{
# make sudo complete correctly with root-only dirs on debian
  zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
          /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

  # zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'
  # #     zstyle ':completion::complete:*' use-cache 1
  #

# Compinstall automatic preferences, don't touch comments or indent # {{{
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'set:%d'
zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort name
# zstyle ':completion:*' format 'Comp(%d)'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt "%B%F{magenta}At %p (%l): Hit TAB for more, or the character to insert%f%b"
zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt "%B%F{magenta}Scrolling: %l (%p)%f%b"
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/hector/.zconf/.zshrc'

# compinit gets called on prezto's completion module 
# autoload -Uz compinit
# compinit
# End of lines added by compinstall
# }}}
# }}}
#
# 1. Source Prezto, local packages and UserFunctions  # {{{
  # Source Prezto.
  [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]] && \
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

  # Source local packages (gcloud, harvest, et al)
  [[ -s "${ZDOTDIR:-$HOME}/source.d/" ]] && \
    for sourcefile in ${ZDOTDIR}/source.d/**
      source "${sourcefile}"

  # autoload quick functions useful to have but too small to warrant a module
  [[ -s "${ZDOTDIR:-$HOME}/UserFunctions/" ]] && \
    for func in ${ZDOTDIR:-$HOME}/UserFunctions/**
      autoload -Uz ${func:t}

typeset -x GREP_COLOR='38;5;1' # Personal override since 2010!

# }}}

# 2. Zsh options# {{{
  # 2.1 Changing dirs
    setopt autocd autopushd nopushdsilent pushdtohome
  # 2.2 completion
    setopt autonamedirs autoparamkeys autoremoveslash globcomplete hashlistall
    setopt listambiguous listpacked listtypes
  # 2.3 Globbing
    setopt braceccl casematch markdirs numericglobsort nonomatch
  # 2.4 History
    setopt nohistignorespace histlexwords histreduceblanks histverify
    setopt incappendhistorytime
  # 2.5 Correct
    setopt ignoreeof hashdirs hashexecutablesonly rmstarwait shortloops
    # setopt recexact
# }}}

# 3. Aliases {{{
  # Le BSD aliases: # {{{
    if [[ "$OSTYPE" == (darwin*|*bsd*) ]]; then
      unfunction ls 2> /dev/null
      unalias ls
      set CLICOLOR
      set LSCOLORS='exfxcxdxbxegedabagacad'
      alias ls='/bin/ls -FGh'
    fi
    #correct prezto's default notion of l and ls
    unalias l
    unalias ls
    alias ls='ls -F --group-directories-first --color=auto'
    alias lC='ls --color=always'
    alias l='ls -l'
    alias la='ls -a'
    alias lA='ls -A'
    alias lla='ls -la'
    alias ll='ls -l'
    alias llra='ls -lRa'
    alias llr='ls -lR'
    alias lr='ls -R'
    alias lsa='ls -ld .*'
    alias lsd='ls -ld *(-/DN)'
      # lstree and friends. # {{{
      # Note we defined lstree as a UserFunction to relay arguments to tree(1)
      if ((${+commands[tree]})); then
        alias ldt='tree -dCL 1'
        alias ldtt='tree -dCL 2'
        alias ldttt='tree -dCL 3'
        alias lstd='tree -dC | less -R'
        alias lst='tree -C | less -R'
        alias lt='tree -CL 1'
        alias ltt='tree -CL 2'
        alias lttt='tree -CL 3'
        alias tree='tree -C'
      else
        # TODO: write need() UserFunction
        alias ldt='need tree'
        alias ldtt='need tree'
        alias ldttt='need tree'
        alias lstd='need tree'
        alias lst='need tree'
        alias lt='need tree'
        alias ltt='need tree'
        alias lttt='need tree'
        alias tree='need tree'
      fi
      # }}}
  # }}}
  # Macvim aliases    # {{{
    if (( $+mac )) ; then
      if (( $+TMUX )) ; then
        alias mvim="/usr/local/bin/mvim"
        alias mvim="/usr/local/bin/mvim"
        alias mvimdiff="/usr/local/bin/mvimdiff"
        alias mvimex="/usr/local/bin/mvimex"
        alias vim="/usr/local/bin/vim"
        alias vimcat="/usr/local/bin/vimcat"
        alias vimdiff="/usr/local/bin/vimdiff"
        alias vimpager="/usr/local/bin/vimpager"
      else
        alias rtun="reattach-to-user-namespace" #make mac clipboard work
        alias mvim="rtun /usr/local/bin/mvim"
        alias mvim="rtun /usr/local/bin/mvim"
        alias mvimdiff="rtun /usr/local/bin/mvimdiff"
        alias mvimex="rtun /usr/local/bin/mvimex"
        alias vim="rtun /usr/local/bin/vim"
        alias vimcat="rtun /usr/local/bin/vimcat"
        alias vimdiff="rtun /usr/local/bin/vimdiff"
        alias vimpager="rtun /usr/local/bin/vimpager"
      fi
    fi
  # }}}
  # Global aliases # {{{
    alias -g CA='|& cat -A' linux
    alias -g CA='|& cat -etv' #bsdish
    alias -g F='| tail -f'
    alias -g G='| grep'
    alias -g H='| head'
    alias -g LL='|& less'
    alias -g L='| less '
    alias -g LR='| less -R'
    alias -g NE='2> /dev/null'
    alias -g NUL='&> /dev/null'
    alias -g P='|& pygmentize -l pytb'
    alias -g T='| tail'
  # }}}
  # Suffix aliases # {{{
    alias -s txt=vim
    alias -s json=jsonfunc
  # }}}
  # Personal additions # {{{
    # very vim behavior {{{
      alias :q="exit"
      alias qq="exit"
      alias ZZ="exit"
    # }}}
    # harvest command line client# {{{
      # source $(ruby -e "print File.dirname(Gem.bin_path('hcl', 'hcl'))")/_hcl_completions
      alias hcl='nocorrect hcl'
    # }}}
    alias colorize='pygmentize -s -l sh -f 258 -O style=solarizeddark | less -RS '
    alias fuck='$(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
    alias git-describe='git describe --tags --long --abbrev --dirty --always'
    alias git-describe='git describe --tags --long --abbrev --dirty --always'
    alias info='info --vi-keys'
    alias list-keys=lsbindings
    alias lskeys=lsbindings
    alias monofonts='fc-list :scalable=true:spacing=mono: family |sort|uniq'
    alias nmap-full='nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v'
    alias pgp='gpg'
    alias tmux='tmux -f ~/src/Dotfiles/dotfiles/tmux.d/tmux.conf'
  # }}}
# }}}

# 4. Keybindings {{{
  # Dynamic keypad # {{{
    typeset key_left=$terminfo[kcub1]
    typeset key_right=$terminfo[kcuf1]
    typeset key_up=$terminfo[kcuu1]
    typeset key_down=$terminfo[kcud1]

    zle -N down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey -M vicmd "$key_down"  down-line-or-beginning-search
    bindkey -M vicmd "$key_left"  vi-backward-char
    bindkey -M vicmd "$key_right" vi-forward-char
    bindkey -M vicmd "$key_up"    up-line-or-beginning-search
    bindkey -M viins "$key_down"  down-line-or-beginning-search
    bindkey -M viins "$key_left"  vi-cmd-mode
    # bindkey -M viins "$key_right" expand-or-complete-with-indicator #
    bindkey -M viins "$key_right" vi-forward-char
    bindkey -M viins "$key_up"    up-line-or-beginning-search

    # old static keypads, deprecated # {{{
    #   {{{ Keypad [OX
    #     key_left='^[OD'
    #     key_right='^[OC'
    #     key_up='^[OA'
    #     key_down='^[OB'
    #     bindkey -M viins "$key_down" down-line-or-search
    #     bindkey -M viins "$key_left" vi-cmd-mode
    #     bindkey -M viins "$key_right" vi-forward-char
    #     bindkey -M viins "$key_up" up-line-or-search
    #   }}}
    #   {{{ Keypad [[X
    #     key_left='^[[D'
    #     key_right='^[[C'
    #     key_up='^[[A'
    #     key_down='^[[B'
    #   }}}
    # }}}

  # }}}
  # F-Keys # {{{
    typeset key_F1=$terminfo[kf1]
    typeset key_F2=$terminfo[kf2]
    typeset key_F3=$terminfo[kf3]

    local -a bindmodes
    bindmodes=(vicmd viins emacs)
    for bindmode in $bindmodes
    do
      bindkey -M $bindmode "\C-I" complete-word
      bindkey -M $bindmode "$key_F1" run-help
      bindkey -M $bindmode "$key_F2" describe-key-briefly
      bindkey -M $bindmode "$key_F3" which-command
    done
    unset bindmodes
      # yet to be assigned {{{
      # typeset key_F4=$terminfo[kf4]
      # typeset key_F5=$terminfo[kf5]
      # typeset key_F6=$terminfo[kf6]
      # typeset key_F7=$terminfo[kf7]
      # typeset key_F8=$terminfo[kf8]
      # typeset key_F9=$terminfo[kf9]
      # typeset key_F10=$terminfo[kf10]
      # typeset key_F11=$terminfo[kf11]
      # typeset key_F12=$terminfo[kf12]
      # bindkey -M $bindmode "$key_F4"
      # bindkey -M $bindmode "$key_F5"
      # bindkey -M $bindmode "$key_F6"
      # bindkey -M $bindmode "$key_F7"
      # bindkey -M $bindmode "$key_F8"
      # bindkey -M $bindmode "$key_F9"
      # bindkey -M $bindmode "$key_F10"
      # bindkey -M $bindmode "$key_F11"
      # bindkey -M $bindmode "$key_F12"
      # }}}
  # }}}
  # Incremental search # {{{
    bindkey -M vicmd '/' history-incremental-pattern-search-backward
    bindkey -M vicmd '?' history-incremental-pattern-search-forward
  # }}}
  # command position search # {{{
    bindkey -M vicmd 'l' expand-or-complete-with-indicator
    bindkey -M vicmd 'J' down-line-or-search
    bindkey -M vicmd 'K' up-line-or-search
    bindkey -M vicmd 'h' infer-next-history
  # }}}
  # cd history with arrowkeys  not in use, awkward #{{{
    # zle -N dir-nav-prev
    # zle -N dir-nav-next
    # bindkey -a "$key_left" dir-nav-prev
    # bindkey -a "$key_right" dir-nav-next
  # }}}
  # Scroll most recent file [*N] # {{{
    # zstyle ':completion:most-recent-file:*' match-original both
    # zstyle ':completion:most-recent-file:*' file-sort modification
    # zstyle ':completion:most-recent-file:*' file-patterns '*(.)'
    # zstyle ':completion:most-recent-file:*' hidden all
    # zstyle ':completion:most-recent-file:*' completer _files
    # zle -C most-recent-file menu-complete _generic
    # bindkey "^N" most-recent-file
  # }}}
  # Last word {prev,current} cmd # {{{
    zstyle ':completion:expand-args-of::::' completer expand-args-of
    bindkey -M vicmd "\C-X\C-A" expand-args-of
    bindkey -M viins "\C-Pe" copy-earlier-word    # do something else then comeback
    bindkey -M viins "\C-Pp" copy-prev-shell-word # Repeat what i just said
    bindkey -M viins "\C-Pl" ínsert-last-word     # Repeat what i just said on the last line
    bindkey -M viins "\C-PL" push-line            # Repeat what i just said on the last line
  # }}}
  # Kick-ass sequences {{{
    bindkey -M viins -s "\C-X\C-V" "\$\(xclip -o\)\C-Xe "     # paste whatever lives on xclip
    bindkey -M viins -s "\e$a\C-X\C-P" "\$\(xclip -o\)\C-Xe " # same, but go to viins, appending frst
    bindkey -M vicmd -s "A\C-X\C-P" "\$\(xclip -o\)\C-Xe "    # same, but go to viins, appending frst
    bindkey -M vicmd -s "i\C-X\C-V" "\$\(xclip -o\)\C-Xe "    # same, but go to viins, but rather in place insert
    # bindkey -M vicmd -s "\C-X" "^Xa\ee"
    bindkey -M vicmd -s "qq" "\C-Csync;\C-Msync;\C-Mexit\C-M" # exit shell, syncing disks
    bindkey -M vicmd -s "ZZ" "qq"                             # ^-- same
  # }}}
  # TODO: old tcsh C-Z vim suspend and resume toggle {{{
    # bindjey -M
    # bindkey -M vicmd -s "\C-Z" "stty susp \^W\C-M && %?vim\C-Mbindkey -rM vicmd ^Z\CM"
    # bindkey -M viins
  # }}}
  # Personal overrides# {{{
    bindkey -M vicmd "\C-X \C-E" expand-word
    bindkey -M vicmd "v" edit-command-line
    bindkey -M vicmd ',"' quote-line
    bindkey -M vicmd ',x' transpose-words
    bindkey -M vicmd ',X' transpose-words
  # }}}
# }}}

# 5. Zsh Extras  # {{{
  # sticky notes # {{{
    autoload -Uz sticky-note
    zstyle :sticky-note notefile ${ZDOTDIR:-$HOME}/zsticky
    zstyle :sticky-note maxnotes 1000
    zstyle :sticky-note sticky-note theme bg yellow fg black
    zle -N sticky-note
    bindkey -M vicmd "\C-N" sticky-note
  # }}}
  # BSDowl Build Syistem # {{{
    local -au mflags
    if (( $+MAKEFLAGS )); then
      mflags=( $MAKEFLAGS )
    else
      mflags=()
    fi
    mflags=( $mflags "-I ${HOME}/share/bsdowl" )
    typeset -x MAKEFLAGS="${mflags[@]}"
    unset mflags
  # }}}
  # moar named dirs# {{{
    zlogs=~zconf/logs.d
    zfuncs=~zconf/UserFunctions
    src=~/src
    nudot=~src/Dotfiles/hlo-dotfiles
    altdot=~src/Dotfiles/dotfiles
  # }}}
  PROMPT='${hostinfo:-""}%F{216}${_prompt_sorin_pwd}%(!. %B%F{1}#%f%b.)${editor_info[keymap]} '
# }}}


#  vim: set ft=zsh sw=2 tw=0 fdm=marker foldlevel=0 et :
