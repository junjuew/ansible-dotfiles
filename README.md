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
* hosts-*: host group files with machine access info. Hosts are the target of
  playbook. There is one such hosts file for each playbook to demonstrate
  available roles to apply with the playbook.
* *-playbook.yml: playbooks to set up machines, including
  * [common-setup-playbook.yml](common-setup-playbook.yml): playbook to setup
        development machines.
  * [gpu-passthrough-playbook.yml](gpu-passthrough-playbook.yml): playbook to
    enable/disable gpu passthrough to kvm guests.
  * [k8s-gpu-playbook.yml](k8s-gpu-playbook.yml) and
    [k8s-gpu-cluster-init-playbook.yml](k8s-gpu-cluster-init-playbook.yml):
    playbooks to install and create k8s GPU cluster.
