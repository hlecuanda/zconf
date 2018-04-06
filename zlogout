#
# Executes commands at logout.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
logger -p syslog.notice "logged out $(time)"

# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {
printf "\n\n\n"
fortune -as

} >&2
