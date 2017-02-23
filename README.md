Personal Configuration Setup on a New Machine Using Ansible
-------------------------------------------

To run:

1. Modify hosts to be your machine
2. Set user through env variable ANSIBLE_ENV_CONFIG_USER and password through ANSIBLE_ENV_CONFIG_PS
3. Modify group_vars/desktops to configure whether you want to install emacs gui, fish, and what fish auto completions scripts to install
5. Install dependency:
   
        ansible-galaxy install -r requirements.yml        

4. Run:

        ansible-playbook -i hosts site.yml

Role "common"
-----------------------
1. setup ntp


Role "basic"
-----------------------
1. configure .bashrc, .bash_aliases

Role "Advanced"
-----------------------
Install and configure

1. fish
2. [fzf](https://github.com/junegunn/fzf)
3. [z for bash](https://github.com/rupa/z), [z for fish](https://github.com/sjl/z-fish)
4. emacs