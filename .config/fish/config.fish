if status is-interactive
    # Commands to run in interactive sessions can go here
end

# add stuff to path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"


# Start ssh-agent if not already running
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
end

starship init fish | source
