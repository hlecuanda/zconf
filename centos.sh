sudo apyumt install -y git tig zsh tmux jq figlet mosh pwgen vim-nox make
ssh-keygen -H
git clone https://gitlab.com/hlecuanda/zconf.git .zconf
git clone --recursive https://github.com/sorin-ionescu/prezto.git .zconf/.zprezto
make -C .zconf/zsh.d install
make -C .zconf/vim.d install
make -C .zconf/tmux.d install
make -C .zconf/bin.d install
exec zsh -l