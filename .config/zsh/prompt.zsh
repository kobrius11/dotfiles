

# load git info plugin (vcs)
autoload -Uz vcs_info
precmd() { vcs_info } # Updates git info before every prompt

#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )

# format vcs prompt
zstyle ':vcs_info:git:*' formats ' %b'

# Prompt
NEWLINE=$'\n'
DEEP_BLUE='{#2E3440}'
LIGHT_BLUE='{#E5E9F0}'
TIME_BLOCK_STYLE='%K${DEEP_BLUE}%F${LIGHT_BLUE}'
USER_BLOCK_STYLE='%K{#3b4252}%F{#ECEFF4}'
PATH_BLOCK_STYLE='%K{#4c566a}'
TIME='%D{%_I:%M%p}'


GIT_PROMPT='%K{#3b4252}%F{#ECEFF4} ${vcs_info_msg_0_} %f%k'
PROMPT="$NEWLINE$TIME_BLOCK_STYLE$TIME $USER_BLOCK_STYLE %n $PATH_BLOCK_STYLE %~ $GIT_PROMPT ❯ "


