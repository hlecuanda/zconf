sudo apt install -y git tig zsh tmux jq figlet mosh pwgen vim-nox make
echo 'gitlab.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFSMqzJeV9rUzU4kWitGjeR4PWSa29SPqJ1fVkhtj3Hw9xjLVXVYrU9QlYWrOLXBpQ6KWjbjTDTdDkoohFzgbEY=' >> ~/.ssh/known_hosts
ssh-keygen -H
git clone git@gitlab.com:hlecuanda/zconf.git .zconf
git clone --recursive git@github.com:sorin-ionescu/prezto.git .zconf/.zprezto
make -C .zconf/zsh.d install
make -C .zconf/vim.d install
make -C .zconf/tmux.d install
make -C .zconf/bin.d install
exec zsh -l

