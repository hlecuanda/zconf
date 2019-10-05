zstyle ':prezto:module:history-substring-search:color' found 'red'      # Set the query found color.
zstyle ':prezto:module:history-substring-search:color' not-found 'white' # Set the query not found color.
zstyle ':prezto:module:git:info:action' format '%F{white}:%f%%B%F{11}%s%f%%b'
zstyle ':prezto:module:git:info:added' format ' %%B%F{white}✚%f%%b'
zstyle ':prezto:module:git:info:ahead' format ' %%B%F{white}⬆%f%%b'
zstyle ':prezto:module:git:info:behind' format ' %%B%F{white}⬇%f%%b'
zstyle ':prezto:module:git:info:branch' format ' %%B%F{white}%b%f%%b'
zstyle ':prezto:module:git:info:commit' format ' %%B%F{white}%.7c%f%%b'
zstyle ':prezto:module:git:info:deleted' format ' %%B%F{white}✖%f%%b'
zstyle ':prezto:module:git:info:keys' format 'status' '%b %p %c:%s%A%B%S%a%d%m%r%U%u'
zstyle ':prezto:module:git:info:modified' format ' %%B%F{white}✱%f%%b'
zstyle ':prezto:module:git:info:position' format ' %%B%F{white}%p%f%%b'
zstyle ':prezto:module:git:info:renamed' format ' %%B%F{white}➜%f%%b'
zstyle ':prezto:module:git:info:stashed' format ' %%B%F{white}✭%f%%b'
zstyle ':prezto:module:git:info:unmerged' format ' %%B%F{white}═%f%%b'
zstyle ':prezto:module:git:info:untracked' format ' %%B%F{white}◼%f%%b'
zstyle ':prezto:module:editor:info:completing' format '%B%F{7}...%f%b'
zstyle ':prezto:module:editor:info:keymap:alternate' format ' %B%F{white}❮%F{220}❮%F{3}❮%f%b'
zstyle ':prezto:module:editor:info:keymap:primary' format ' %B%F{3}❯%F{220}❯%F{white}❯%f%b'
zstyle ':prezto:module:editor:info:keymap:primary:overwrite' format ' %B%F{white}❮%F{220}❮%F{3}❮%f%b'
# Enabled Highlighters {{{
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'cursor'
## }}}
# current colors in use# {{{
zstyle ':prezto:module:syntax-highlighting' styles       \
  "unknown-token"                  "fg=red"    \
  "default"                        "fg=white"              \
  "precommand"                     "fg=blue,standout"       \
  "builtin"                        "fg=blue,standout,underline"        \
  "reserved-word"                  "fg=blue,underline"  \
  "command"                        "fg=blue,standout"          \
  "hashed-command"                 "fg=blue,standout"   \
  "function"                       "fg=blue"               \
  "alias"                          "fg=blue,underline,standout"     \
  "commandseparator"               "fg=cyan"             \
  "assign"                         "fg=yellow"           \
  "path_prefix"                    "fg=13,underline"     \
  "path"                           "fg=13"               \
  "globbing"                       "fg=yellow,underline" \
  "suffix-alias"                   "fg=57,standout"          \
  "cursor"                         "bg=240 fg=white"     \
  "cursor-matchingbracket"         "bg=red"              \
  "history-expansion"              "fg=green,standout"       \
  "root"                           "bg=red,standout"         \
  "back-double-quoted-argument"    "fg=red"              \
  "back-quoted-argument"           "fg=red"              \
  "dollar-double-quoted-argument"  "fg=white"              \
  "double-hyphen-option"           "fg=white"            \
  "double-quoted-argument"         "fg=cyan"             \
  "single-hyphen-option"           "fg=white"            \
  "single-quoted-argument"         "fg=cyan,underline"   \
  "bracket-error"                  "bg=red,standout"         \
  "bracket-level-1"                "fg=yellow"           \
  "bracket-level-2"                "fg=green"            \
  "bracket-level-3"                "fg=magenta"          \
  "bracket-level-4"                "fg=cyan"             \
  "redirection"                    "fg=yellow,standout"      \
  "comment"                        "fg=240,underline"    \
  "arg0"                           "fg=white"              \
# }}}
#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
