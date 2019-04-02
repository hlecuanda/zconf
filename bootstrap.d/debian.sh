sudo apt install -y git tig zsh tmux jq figlet mosh pwgen
git clone git@gitlab.com:hlecuanda/zconf.git .zconf
git clone --recursive git@github.com:sorin-ionescu/prezto.git .zconf/.zprezto
make -C .zconf/zsh.d install
make -C .zconf/vim.d install
make -C .zconf/tmux.d install
make -C .zconf/bin.d install
exec zsh -l


