# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pi/src/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/pi/src/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pi/src/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/pi/src/fzf/shell/key-bindings.zsh"
