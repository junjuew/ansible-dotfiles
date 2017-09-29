Personal Configuration Setup on a New Machine Using Ansible
-------------------------------------------

To run:

1. Modify hosts to be machine hostname or ip.
3. Modify group_vars/desktops to configure whether you want to install emacs gui, fish, and what fish auto completions scripts to install
4. Run:

        ./run.sh

Role "common"
-----------------------
1. setup ntp


Role "basic"
-----------------------
1. configure .bashrc, .bash_aliases

Role "Advanced"
-----------------------
Install and configure

1. fish + fish completions
2. [fzf](https://github.com/junegunn/fzf)
3. [z for bash](https://github.com/rupa/z), [z for fish](https://github.com/sjl/z-fish)
4. emacs25 or emacs24-nox
4. gnome-tweak-tool
5. [direnv](https://direnv.net/)
