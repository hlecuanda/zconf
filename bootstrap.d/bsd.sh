sudo pkg install -y figlet git gmake mosh pwgen python \
    tig tmux vim thefuck zsh

git clone git@gitlab.com:hlecuanda/zconf.git .zconf
git clone --recursive git@github.com:sorin-ionescu/prezto.git .zconf/.zprezto
gmake -C .zconf/zsh.d install
gmake -C .zconf/vim.d install
gmake -C .zconf/tmux.d install
gmake -C .zconf/bin.d install
exec zsh -l
