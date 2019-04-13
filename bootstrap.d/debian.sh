sudo apt install -y git tig zsh tmux jq figlet mosh pwgen vim-nox make
git clone https://gitlab.com/hlecuanda/zconf.git .zconf
git clone --recursive https://github.com/sorin-ionescu/prezto.git .zconf/.zprezto
make -C .zconf install
exec zsh -l

