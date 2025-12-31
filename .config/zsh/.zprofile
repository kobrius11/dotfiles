# default programs
export EDITOR="nvim"

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other zsh config files can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# history files
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"

# add scripts to path
export PATH="$XDG_CONFIG_HOME/scripts:$PATH"

echo "Working.."
