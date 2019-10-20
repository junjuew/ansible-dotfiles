# set up editor
if type -q vim
    set -gx EDITOR vim
end

# setup gpg2 tty for git signing
set -gx GPG_TTY (tty)

# source bash variables if bass is available
if type -q bass
    test -f /etc/profile; and bass source /etc/profile
    test -f ~/.profile; and bass source ~/.profile
    test -f ~/.bashrc_custom; and bass source ~/.bashrc_custom
end

# set up conda
if test -d "$HOME/miniconda/bin"
    source "$HOME/miniconda/etc/fish/conf.d/conda.fish"
    conda activate
end

# set up direnv hook
if type -q direnv
    eval (direnv hook fish)
end

# Start SSH Agent if it is not already running, and add the
# id_(nice_hostname) identity.
setenv SSH_ENV "$HOME/.ssh/environment"
if [ -n "$SSH_AUTH_SOCK" ]
    ps -ef | /bin/grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | /bin/grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

# set up user fish alias
# this is done in the end to avoid user aliasing
# interfere with initialization files
if test -e ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end