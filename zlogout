#
# Executes commands at logout.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
command cp /dev/null > ~zconf/logs.d/zcompile.log
logger -p syslog.notice "logged out $(time)"
# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {

# Print the message.
cat <<-EOF

Thank you. Come again!
  -- Dr. Apu Nahasapeemapetilon
EOF

} >&2
