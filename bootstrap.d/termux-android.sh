pkg install -y binutils command-not-found coreutils \
    curl diffutils figlet file git golang grep make \
    man mosh openssh procps pwgen python termux-am \
    termux-api termux-exec termux-tools tig tmux vim \
    thefuck zsh

git clone git@gitlab.com:hlecuanda/zconf.git .zconf
git clone --recursive git@github.com:sorin-ionescu/prezto.git .zconf/.zprezto
make -C .zconf/zsh.d install
make -C .zconf/vim.d install
make -C .zconf/tmux.d install
make -C .zconf/bin.d install
exec zsh -l
