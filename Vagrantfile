# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

unless Vagrant.has_plugin?("vagrant-cachier")
  puts "Install vagrant-cachier"
  exec 'vagrant plugin install vagrant-cachier && vagrant up'
end

unless Vagrant.has_plugin?("vagrant-vbguest")
  puts "Install vagrant-vbguest"
  exec 'vagrant plugin install vagrant-vbguest && vagrant up'
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/xenial64"
  config.vm.box = "ubuntu/xenial64"

  config.vm.hostname = "development-box"

  config.vm.provision "shell", inline: "sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y install ubuntu-desktop && echo 'autologin-user=ubuntu' | sudo tee -a /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf && sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev python-pip && pip install --upgrade pip && pip install ansible==2.2.2.0 && pip install pyopenssl"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.cache.scope = :machine

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
