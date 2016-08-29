
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'vagrant.machine'

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 4567, host: 4567
  config.vm.network "private_network", type: "dhcp"
  #config.vm.network 'private_network', ip: '192.168.35.10'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
    vb.cpus = 2
  end

  config.vm.synced_folder "./", "/home/vagrant/", type: 'nfs'
  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = "ansible/provision.yml"
    ansible.verbose = 'vvv'
  end

  # Usage better_errors on Vagrant
  # run `vagrant plugin install vagrant-host-path`

  if Vagrant.has_plugin?("vagrant-host-path")
    # Enable or disable plugin (enabled by default)
    config.host_path.enabled = true

    # The environment key to set
    config.host_path.env_key = "VAGRANT_HOST_PATH"

    # Temp file to save path to
    config.host_path.path_file = "/tmp/.vagrant-host-path"

    # Profile script path
    config.host_path.profile_path = "/etc/profile.d/vagrant-host-path.sh"
  end
end

