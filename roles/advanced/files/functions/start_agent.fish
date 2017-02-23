# ~/.config/fish/functions/start_agent.fish

# Start SSH Agent and set relevant variables
function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV 
    . $SSH_ENV > /dev/null
    ssh-add ~/.ssh/id_rsa
end
