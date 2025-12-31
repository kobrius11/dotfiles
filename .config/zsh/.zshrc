# source global shell alias & variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"
[ -f "$XDG_CONFIG_HOME/zsh/prompt.zsh" ] && source "$XDG_CONFIG_HOME/zsh/prompt.zsh"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=\;33
#zstyle ':completion:*' file-list true
zstyle ':completion:*' squeeze-slasher false

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:descriptions' format '%F{#E5E9F0}-- %d --%f'

# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
setopt prompt_subst
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth

# zsh-autosuggestions
[ -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ] && source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-higlighting
[ -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ] && source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# zsh-autocomplete
[ -d "$ZSH_PLUGINS_DIR/zsh-autocomplete" ] && source "$ZSH_PLUGINS_DIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

echo -e "${NEWLINE}\x1b[38;5;137m\x1b[48;5;0m it's$(print -P '%D{%_I:%M%P}\n') \x1b[38;5;180m\x1b[48;5;0m $(uptime -p | cut -c 4-) \x1b[38;5;223m\x1b[48;5;0m $(uname -r) \033[0m"
# fish terminal
#eval "$(starship init zsh)"
