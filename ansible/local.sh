if [ ! -f /usr/bin/ansible-playbook ]
    then
    apt-get install software-properties-common
    apt-add-repository ppa:ansible/ansible
    apt-get update
    apt-get install -y ansible
fi

# ansible-playbook -i "localhost," -vvv -c local  /vagrant/vagrantbox/ansible/provision.yml

cat <<EOF

------------------------------------------------------------------------------
  Ansible successfully installed in guest machine. 
  Now you can get access to guest machine via ssh and run ansible playbooks
-------------------------------------------------------------------------------

 $> vagrant ssh
 
 vagrant@vagrant$> ansible-playbook -i "localhost," -vvv -c local/vagrant/vagrantbox/ansible/provision.yml

-------------------------------------------------------------------------------

EOF

