#! /bin/bash -e

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -s|--user_setup)
        setup_user=true
        ;;
    -p|--pass_through_args)
        # forward the extra args to the ansible-playbook cmd
        extra_args="$2"
        shift
        ;;
    -h|--help)
        printf "Usage: run.sh [-s] [-p|--pass_through_args ansible-playbook-arguments]\n"
        printf "Run ansible-playbook using site.yml\n\n"
        printf "\t-s setup a passwordless sudoer user first.\n"
        printf "\t-p|--pass_through_args arguments passed to ansible-playbook cmd.\n"
        printf "Example:\n"
        printf "./run.sh -s -p \'--tags conda\'\n"
        exit
        ;;
    *)  # unknown option
        ;;
esac
shift # past argument or value
done

echo "extra args passed into ansible-playbook are ${extra_args}"
echo "install dependencies from ansible-galaxy..."
ansible-galaxy install -r requirements.yml

echo "running the scripts for hosts:"
cat hosts

printf "\n\n==============================================\n"
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
    ansible-playbook -i hosts -u ${existing_user} --tags "must_run,user_setup" site.yml
    existing_user=${username}
fi

echo "Running ansible playbook as USER ${existing_user}"
ansible-playbook -i hosts -u ${existing_user} --skip-tags "user_setup" ${extra_args} site.yml
