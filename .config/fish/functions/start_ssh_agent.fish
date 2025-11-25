function start_ssh_agent
    set -l agent_file "$HOME/.ssh/agent_env"

    # Reuse existing agent if valid
    if test -f $agent_file
        source $agent_file >/dev/null
        if ssh-add -l >/dev/null 2>&1
            return 0
        end
    end

    # Start new ssh-agent and capture its output
    set -l output (ssh-agent -s)

    # Parse only variable assignments and strip exports
    for line in $output
        if string match -qr '^SSH_AUTH_SOCK=' $line
            set -x SSH_AUTH_SOCK (string replace -r '^SSH_AUTH_SOCK=([^;]+);.*' '$1' $line)
        else if string match -qr '^SSH_AGENT_PID=' $line
            set -x SSH_AGENT_PID (string replace -r '^SSH_AGENT_PID=([^;]+);.*' '$1' $line)
        end
    end

    # Save clean Fish-compatible lines
    echo "set -x SSH_AUTH_SOCK $SSH_AUTH_SOCK" > $agent_file
    echo "set -x SSH_AGENT_PID $SSH_AGENT_PID" >> $agent_file

    # Load your key quietly
    ssh-add /home/kobrius11/.ssh/keys/homelab01-withpass.key >/dev/null 2>&1
end

