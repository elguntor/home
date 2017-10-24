# Setup fzf
# ---------
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]];then
    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
      export PATH="$PATH:/usr/local/opt/fzf/bin"
    fi

    # Auto-completion
    # ---------------
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/local/opt/fzf/shell/key-bindings.zsh"
else
    # Linux bindings here
fi
