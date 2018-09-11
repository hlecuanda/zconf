pkg install -y git
pkg install -y zsh
git clone git@guthub.com:hlecuanda/zconf.git .zconf
cd .zconf
git checkout nokia3
git clone --recursive git@guthub.com:sorin-ionescu/prezto.git .zprezto
zconf

