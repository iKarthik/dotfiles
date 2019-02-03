# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/demo/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/demo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/demo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/demo/.fzf/shell/key-bindings.zsh"

