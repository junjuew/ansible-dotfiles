#! /bin/bash -e

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -s|--user_setup)
            setup_user=true
            shift
            ;;
        *)  # unknown option
            ;;
    esac
    shift # past argument or value
done

echo "install dependencies from ansible-galaxy..."
ansible-galaxy install -r requirements.yml

echo "running the scripts for hosts:"
cat hosts

echo "Please enter the username with sudo privelege from the deploy machines"
read -p "Existing user with sudo priveleges: " existing_user

if [ "$setup_user" = true ] ; then
    echo "setup_user FLAG is set. We will proceed to create a user first."
    echo "Please enter the username and password you want to create"
    read -p "Username:" username
    read -s -p "Password:" passwd
    printf "\n"
    read -p "Github Account Name to get authorized_keys from:" github_username
    export ANSIBLE_ENV_CONFIG_USER=${username}
    export ANSIBLE_ENV_CONFIG_PS=${passwd}
    export ANSIBLE_ENV_CONFIG_GITHUB_USER=${github_username}

    echo "Running ansible playbook to create USER ${username}"
    ansible-playbook -i hosts site.yml -u ${existing_user} --tags must_run user_setup
    existing_user=${username}
fi

echo "Running ansible playbook as USER ${existing_user}"
ansible-playbook -i hosts site.yml -u ${existing_user} --skip-tags user_setup
