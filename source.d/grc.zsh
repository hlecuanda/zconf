#1/usr/bin/env zsh

# [[ -f .grcdebug  ]] && setopt xtrace sourcetrace || true
if (( $+commands[grc] )) ; then

    typeset -Ua cmds
    typeset -Ua configdirs
    typeset -Ua configs

    configdirs=( /etc/grc /usr/share/grc /usr/local/share/grc )

    [[ -f ~/.newgrc ]] && {


    for dir in $configdirs ;\
      [[ -d $dir  ]] \
        && for new_configfle in $(ls ${dir}/conf.*); \
            configs=($configs $new_configfle)

    for cf in $configs; do
      (( $+commands[${cf:t:e}] )) \
        && { rawf="function ${cf:t:e} () { \
              $commands[${cf:t:e}]  \$@ | grcat ${cf} \
            }";
        prettyf=$( echo $rawf | tr -s \  )
        eval $prettyf } || true
    done

  } || {

    # Prevent grc aliases from overriding zsh completions.
    setopt completealiases


    for dir in $configdirs ;
      [[ -d $dir  ]] \
        && for new_configfle in $(ls ${dir}/conf.*); \
            configs=($configs $new_configfle)

    for cf in $configs;
      (( $+commands[${cf:t:e}] )) \
        && cmds=( $cmds ${cf:t:e} )

    # cmds=( cc \ configure \ cvs \ df \ diff \ dig \ gcc \ gmake \
    # ifconfig \ last \ ldap \ ls \ make \ mount \ mtr \ netstat \ ping \
    # ping6 \ ps \ traceroute \ traceroute6 \ wdiff \);

    # Set alias for available commands.
    for cmd in $cmds ;
        alias $cmd="grc --colour=auto $cmd"

    # Clean up variables
    unset cmds cmd

  }
fi

#
# h@h-lo.me 20200122 004524 -0800 PST 1579682724 d(-_- )b...
# Added guard testing for existance ofcimmand
#  d(-_-;)bm  hlo.mx 1579682676
#  vim:  et :
