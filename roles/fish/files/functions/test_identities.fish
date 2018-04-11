# ~/.config/fish/functions/test_identities.fish

# Add my SSH identity
function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add "~/.ssh/id_rsa"
        if [ $status -eq 2 ]
            start_agent
        end
    end
end
