zstyle -s :prezto:module:UserPrefs:syntax-highlighting theme selected
source ${pmodule_location}/themes/${selected}.zsh \
  || source ${pmodule_location}/themes/default.zsh

# zstyle -s :prezto:module:UserPrefs:widgets load loadwidgets
# [[ $loadwidgets == 'yes' ]]  && {
#   fpath=($pmodule_location/widgets $fpath)
#   for f in $pmodule_location/widgets/** ; do
#     autoload -Uz ${f:t:r}
#     zle -N ${f:t:r}
#   done
# }



zstyle -s :zconf:make makefile mastermakefile
zstyle -b :zconf:make load loadmake
[[ loadmake == "yes" ]] \
  && [[ -f ${mastermakefile} ]] \
      && function make () { make -I${mastermakefile:h} $argv[*] } \
      || : \
  || :

unset selected loadwidgets
#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
