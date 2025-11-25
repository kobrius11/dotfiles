
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
if [[ ":$PATH:" != *":$PNPM_HOME:"* ]]; then
  export PATH="$PNPM_HOME:$PATH"
fi
# pnpm end
# add stuff to path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"


eval "$(starship init zsh)"
