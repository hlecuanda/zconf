# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hector/.vim/bundle/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/hector/.vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hector/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/hector/.vim/bundle/fzf/shell/key-bindings.zsh"
