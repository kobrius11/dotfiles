autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'
add-zsh-hook precmd vcs_info

setopt PROMPT_SUBST

P_GIT=""
# Prompt
PROMPT=' [ %M@%n %~${vcs_info_msg_0_:+ ${vcs_info_msg_0_}} ] ❯ '
RPROMPT=' %? %* '
