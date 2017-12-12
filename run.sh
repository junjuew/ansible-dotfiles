#! /bin/bash -x

echo "install dependencies from ansible-galaxy"
ansible-galaxy install -r requirements.yml

echo "running the scripts for hosts:"
cat hosts

echo "Please enter the username with sudo privelege"
read -p "Username:" username
read -s -p "Password:" passwd

export ANSIBLE_ENV_CONFIG_USER=${username}
export ANSIBLE_ENV_CONFIG_PS=${passwd}
ansible-playbook -i hosts site.yml
