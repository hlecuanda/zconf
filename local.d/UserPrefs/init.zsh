
typeset selected
zstyle -s :prezto:module:UserPrefs:syntax-highlighting theme selected
source ${pmodule_location}/themes/${selected}.zsh || source ${pmodule_location}/themes/default.zsh

unset selected
