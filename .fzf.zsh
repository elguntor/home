# Setup fzf
# ---------
if [[ ! "$PATH" == */home/marshall/.fzf/bin* ]]; then
  export PATH="$PATH:/home/marshall/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/marshall/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/marshall/.fzf/shell/key-bindings.zsh"

