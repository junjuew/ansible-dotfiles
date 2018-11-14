Personal Configuration Setup on a New Machine Using Ansible
-------------------------------------------

To run:

1. Modify hosts to be machine hostname or ip.
3. Modify group_vars/desktops to configure whether you want to install emacs gui, fish, and what fish auto completions scripts to install
4. Run:

        ./run.sh

What's in this Repo
-----------------------
* hosts: inventory file specifying hostnames or IPs and connection configurations of remote machines.
* group_vars: default variables for groups of machines.
* requirements.yml: role requirements from Ansible Galaxy.
* roles: tasks that would be performed for different hosts, organized by roles.
* site.yml: playbook to execute which specifies roles for host groups. 
