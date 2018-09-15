pkg install -y git
pkg install -y zsh
pkg install -y make
git clone git@github.com:hlecuanda/zconf.git .zconf
cd .zconf
git checkout nokia3
git clone --recursive git@github.com:sorin-ionescu/prezto.git .zprezto
chsh -s zsh
make install

