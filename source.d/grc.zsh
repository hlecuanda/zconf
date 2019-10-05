#1/usr/bin/env zsh

# [[ -f .grcdebug  ]] && setopt xtrace sourcetrace || true

    typeset -Ua cmds
    typeset -Ua configdirs
    typeset -Ua configs

    configdirs=( /etc/grc /usr/share/grc /usr/local/share/grc )

  [[ -f ~/.newgrc  ]] && {


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
    setopt COMPLETE_ALIASES


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


#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
