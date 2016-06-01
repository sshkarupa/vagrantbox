# Use rbconfig to determine if we're on a windows host or not.
require 'rbconfig'
is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'vagrant.machine'

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 4567, host: 4567
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 2
  end

  if is_windows
    config.vm.synced_folder "../", "/vagrant"
    # https://github.com/mitchellh/vagrant/issues/6793
    config.vm.provision :shell, inline: <<-SCRIPT
      GALAXY=/usr/local/bin/ansible-galaxy
      echo '#!/usr/bin/env bash
      /usr/bin/ansible-galaxy "$@"
      exit 0
      ' | sudo tee $GALAXY
      sudo chmod 0755 $GALAXY
    SCRIPT
    config.vm.provision 'ansible_local' do |ansible|
      ansible.playbook = "ansible/provision.yml"
      ansible.verbose = 'vvv'
    end
  else
    config.vm.synced_folder "./", "/vagrant", type: 'nfs'
    config.vm.provision 'ansible' do |ansible|
      ansible.playbook = "ansible/provision.yml"
      ansible.verbose = 'vvv'
    end
  end
end
