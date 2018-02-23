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
# Enabled Highlighters {{{
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'cursor' 
## }}}
# current colors in use# {{{
zstyle ':prezto:module:syntax-highlighting' styles       \
  "unknown-token"                  "fg=red,underline"    \
  "default"                        "fg=214"              \
  "precommand"                     "fg=green,bold"       \
  "builtin"                        "fg=cyan,bold"        \
  "reserved-word"                  "fg=green,underline"  \
  "command"                        "fg=12,bold"          \
  "hashed-command"                 "fg=green,standout"   \
  "function"                       "fg=12"               \
  "alias"                          "fg=12,underline"     \
  "commandseparator"               "fg=cyan"             \
  "assign"                         "fg=yellow"           \
  "path_prefix"                    "fg=13,underline"     \
  "path"                           "fg=13"               \
  "globbing"                       "fg=yellow,underline" \
  "suffix-alias"                   "fg=57,bold"          \
  "cursor"                         "bg=240 fg=white"     \
  "cursor-matchingbracket"         "bg=red"              \
  "history-expansion"              "fg=green,bold"       \
  "root"                           "bg=red,bold"         \
  "back-double-quoted-argument"    "fg=red"              \
  "back-quoted-argument"           "fg=red"              \
  "dollar-double-quoted-argument"  "fg=208"              \
  "double-hyphen-option"           "fg=white"            \
  "double-quoted-argument"         "fg=cyan"             \
  "single-hyphen-option"           "fg=white"            \
  "single-quoted-argument"         "fg=cyan,underline"   \
  "bracket-error"                  "bg=red,bold"         \
  "bracket-level-1"                "fg=yellow"           \
  "bracket-level-2"                "fg=green"            \
  "bracket-level-3"                "fg=magenta"          \
  "bracket-level-4"                "fg=cyan"             \
  "redirection"                    "fg=yellow,bold"      \
  "comment"                        "fg=240,underline"    \
  "arg0"                           "fg=208"              \
# }}}
#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
