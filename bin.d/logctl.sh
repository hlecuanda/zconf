#!/usr/bin/env bash
# Wrapper around the awkward command syslog-ng-ctl
# alias to logctl and be happy



# sudo syslog-ng-ctl --help-all
# Syntax: syslog-ng-ctl <command> [options]
# Possible commands are:
#     stats        Dump syslog-ng statistics
#     verbose      Enable/query verbose messages
#     debug        Enable/query debug messages
#     trace        Enable/query trace messages
#     stop         Stop syslog-ng process
#     reload       Reload syslog-ng

LOGCTL="sudo syslog-ng-ctl"
SOCKARG="-c /var/syslog-ng/syslog-ng."


case $ARGV[1] in
    "stats")
        CMD=${LOGCTL} stats ${SOCKARG}
        ;;
    "verbose" )
        CMD=${LOGCTL} verbose --set=on ${SOCKARG}
        ;;
    "debug" )
        CMD=${LOGCTL} debug --set=on ${SOCKARG}
        ;;
    "trace" )
        CMD=${LOGCTL} trace --set=on ${SOCKARG}
        ;;
    "stop")
        CMD=${LOGCTL} stop ${SOCKARG}
        ;;
    "reload")
        CMD=${LOGCTL} reload ${SOCKARG}
        ;;
esac

if [ ${DEBUG} ] ; then
    echo ${CMD}
else
    ${CMD}
fi




