# prompt, et al {{{
zstyle ':prezto:module:history-substring-search:color' found 'red'      # Set the query found color.
zstyle ':prezto:module:history-substring-search:color' not-found '208' # Set the query not found color.
zstyle ':prezto:module:git:info:action' format '%F{208}:%f%%B%F{11}%s%f%%b'
zstyle ':prezto:module:git:info:added' format ' %%B%F{208}✚%f%%b'
zstyle ':prezto:module:git:info:ahead' format ' %%B%F{208}⬆%f%%b'
zstyle ':prezto:module:git:info:behind' format ' %%B%F{208}⬇%f%%b'
zstyle ':prezto:module:git:info:branch' format ' %%B%F{208}%b%f%%b'
zstyle ':prezto:module:git:info:commit' format ' %%B%F{208}%.7c%f%%b'
zstyle ':prezto:module:git:info:deleted' format ' %%B%F{208}✖%f%%b'
zstyle ':prezto:module:git:info:keys' format 'status' '%b %p %c:%s%A%B%S%a%d%m%r%U%u'
zstyle ':prezto:module:git:info:modified' format ' %%B%F{208}✱%f%%b'
zstyle ':prezto:module:git:info:position' format ' %%B%F{208}%p%f%%b'
zstyle ':prezto:module:git:info:renamed' format ' %%B%F{208}➜%f%%b'
zstyle ':prezto:module:git:info:stashed' format ' %%B%F{208}✭%f%%b'
zstyle ':prezto:module:git:info:unmerged' format ' %%B%F{208}═%f%%b'
zstyle ':prezto:module:git:info:untracked' format ' %%B%F{208}◼%f%%b'
zstyle ':prezto:module:editor:info:completing' format '%B%F{7}...%f%b'
zstyle ':prezto:module:editor:info:keymap:alternate' format ' %B%F{208}❮%F{220}❮%F{3}❮%f%b'
zstyle ':prezto:module:editor:info:keymap:primary' format ' %B%F{3}❯%F{220}❯%F{208}❯%f%b'
zstyle ':prezto:module:editor:info:keymap:primary:overwrite' format ' %B%F{208}❮%F{220}❮%F{3}❮%f%b'
## }}}

# Enabled Highlighters {{{
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'cursor' 
## }}}

case "$TERM" in
  *xterm*)
  screen*)
      # xterm # {{{
      zstyle ':prezto:module:syntax-highlighting' styles         \
        "unknown-token"                  "fg=red,underline"      \
        "default"                        "fg=3"                  \
        "precommand"                     "fg=166"                \
        "builtin"                        "fg=214,underline"      \
        "command"                        "fg=214,bold"           \
        "hashed-command"                 "fg=214,standout"       \
        "function"                       "fg=214,bold,underline" \
        "alias"                          "fg=214"                \
        "reserved-word"                  "fg=178"                \
        "commandseparator"               "fg=11"                 \
        "assign"                         "fg=15"                 \
        "path_prefix"                    "fg=220,underline"      \
        "path"                           "fg=220"                \
        "globbing"                       "fg=202"                \
        "suffix-alias"                   "fg=202,bold"           \
        "cursor"                         "bg=240 fg=white"       \
        "cursor-matchingbracket"         "bg=red fg=black"       \
        "history-expansion"              "fg=208,bold"           \
        "root"                           "bg=red,bold"           \
        "back-double-quoted-argument"    "fg=red"                \
        "back-quoted-argument"           "fg=red"                \
        "dollar-double-quoted-argument"  "fg=208"                \
        "double-hyphen-option"           "fg=white"              \
        "double-quoted-argument"         "fg=11"                 \
        "single-hyphen-option"           "fg=white"              \
        "single-quoted-argument"         "fg=11,underline"       \
        "bracket-error"                  "bg=red,bold"           \
        "bracket-level-1"                "fg=yellow"             \
        "bracket-level-2"                "fg=green"              \
        "bracket-level-3"                "fg=magenta"            \
        "bracket-level-4"                "fg=cyan"               \
        "redirection"                    "fg=11,bold"            \
        "comment"                        "fg=172,underline"      \
        "arg0"                           "fg=208"                \
      # }}}
    ;;
  urxvt)
      # urxvt # {{{
      zstyle ':prezto:module:syntax-highlighting' styles         \
        "unknown-token"                  "fg=red,standout"      \
        "default"                        "fg=3"                  \
        "precommand"                     "fg=166"                \
        "builtin"                        "fg=214,standout"      \
        "command"                        "fg=214,bold"           \
        "hashed-command"                 "fg=214,standout"       \
        "function"                       "fg=214,bold,standout" \
        "alias"                          "fg=214"                \
        "reserved-word"                  "fg=178"                \
        "commandseparator"               "fg=11"                 \
        "assign"                         "fg=15"                 \
        "path_prefix"                    "fg=220,standout"      \
        "path"                           "fg=220"                \
        "globbing"                       "fg=202"                \
        "suffix-alias"                   "fg=202,bold"           \
        "cursor"                         "bg=240 fg=white"       \
        "cursor-matchingbracket"         "bg=red fg=black"       \
        "history-expansion"              "fg=208,bold"           \
        "root"                           "bg=red,bold"           \
        "back-double-quoted-argument"    "fg=red"                \
        "back-quoted-argument"           "fg=red"                \
        "dollar-double-quoted-argument"  "fg=208"                \
        "double-hyphen-option"           "fg=white"              \
        "double-quoted-argument"         "fg=11"                 \
        "single-hyphen-option"           "fg=white"              \
        "single-quoted-argument"         "fg=11,standout"       \
        "bracket-error"                  "bg=red,bold"           \
        "bracket-level-1"                "fg=yellow"             \
        "bracket-level-2"                "fg=green"              \
        "bracket-level-3"                "fg=magenta"            \
        "bracket-level-4"                "fg=cyan"               \
        "redirection"                    "fg=11,bold"            \
        "comment"                        "fg=172,standout"      \
        "arg0"                           "fg=208"                \
      # }}}
    ;;
  *)
    echo "$TERM Didn't match anything"
      # xterm # {{{
      zstyle ':prezto:module:syntax-highlighting' styles         \
        "unknown-token"                  "fg=red,underline"      \
        "default"                        "fg=3"                  \
        "precommand"                     "fg=166"                \
        "builtin"                        "fg=214,underline"      \
        "command"                        "fg=214,bold"           \
        "hashed-command"                 "fg=214,standout"       \
        "function"                       "fg=214,bold,underline" \
        "alias"                          "fg=214"                \
        "reserved-word"                  "fg=178"                \
        "commandseparator"               "fg=11"                 \
        "assign"                         "fg=15"                 \
        "path_prefix"                    "fg=220,underline"      \
        "path"                           "fg=220"                \
        "globbing"                       "fg=202"                \
        "suffix-alias"                   "fg=202,bold"           \
        "cursor"                         "bg=240 fg=white"       \
        "cursor-matchingbracket"         "bg=red fg=black"       \
        "history-expansion"              "fg=208,bold"           \
        "root"                           "bg=red,bold"           \
        "back-double-quoted-argument"    "fg=red"                \
        "back-quoted-argument"           "fg=red"                \
        "dollar-double-quoted-argument"  "fg=208"                \
        "double-hyphen-option"           "fg=white"              \
        "double-quoted-argument"         "fg=11"                 \
        "single-hyphen-option"           "fg=white"              \
        "single-quoted-argument"         "fg=11,underline"       \
        "bracket-error"                  "bg=red,bold"           \
        "bracket-level-1"                "fg=yellow"             \
        "bracket-level-2"                "fg=green"              \
        "bracket-level-3"                "fg=magenta"            \
        "bracket-level-4"                "fg=cyan"               \
        "redirection"                    "fg=11,bold"            \
        "comment"                        "fg=172,underline"      \
        "arg0"                           "fg=208"                \
      # }}}
esac

#  vim: set ft=zsh sw=2 tw=0 fdm=marker et :
