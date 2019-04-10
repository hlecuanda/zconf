sudo pkg install -y figlet git gmake mosh pwgen python \
    tig tmux vim thefuck zsh

echo 'gitlab.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=' >> ~/.ssh/known_hosts
ssh-keygen -H
git clone git@gitlab.com:hlecuanda/zconf.git .zconf
git clone --recursive git@github.com:sorin-ionescu/prezto.git .zconf/.zprezto
gmake -C .zconf/zsh.d install
gmake -C .zconf/vim.d install
gmake -C .zconf/tmux.d install
gmake -C .zconf/bin.d install
exec zsh -l
