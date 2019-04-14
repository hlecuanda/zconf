sudo apt -q install -y curl diffuse figlet git googler jq make mosh pv pwgen rofi \
thefuck tigtigervnc-standalone-server tigervnc-viewer tmux vim-nox vlc xdotool zsh
xclip xterm feh exiftool highlight ranger
clone https://gitlab.com/hlecuanda/zconf.git .zconf
git clone --recursive https://github.com/sorin-ionescu/prezto.git .zconf/.zprezto
make -C .zconf install
exec zsh -l

# binutils command-not-found coreutils curl diffutils figlet file git golang grep make man
# mosh openssh procps pwgen python termux-am termux-api termux-exec termux-tools tig tmux
# vim zsh git
#  vim: set ft=zsh sw=4 tw=0 fdm=manual et :

