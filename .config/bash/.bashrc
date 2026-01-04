#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# add stuff to path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
