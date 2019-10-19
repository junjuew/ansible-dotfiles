# Start SSH Agent if it is not already running, and add the
# id_(nice_hostname) identity.
setenv SSH_ENV "$HOME/.ssh/environment"
if [ -n "$SSH_AUTH_SOCK" ]
    ps -ef | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

# set up fish alias
if test -e ~/.config/fish/aliases.fish
    . ~/.config/fish/aliases.fish
end

# set up bash variables if bass is available
if type -q bass
    test -e ~/.bashrc_custom; and bass source ~/.bashrc_custom
end

# set up conda
if type -q conda
    source (conda info --root)/etc/fish/conf.d/conda.fish
end

# set up direnv hook
if type -q direnv
    eval (direnv hook fish)
end