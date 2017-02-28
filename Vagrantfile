# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.vm.network 'private_network', ip: '172.168.35.15'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 2024
  end

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'ansible/provision.yml'
    ansible.verbose = 'vvv'
  end
end
