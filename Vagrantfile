# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false

  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/vivid/current/vivid-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box = "vivid"

  config.vm.define "node1" do |node1|
      node1.vm.provision "shell", path: "bootstrap.sh"
#      node1.vm.hostname = "consoul-demo"
      node1.vm.network "private_network", ip: "172.10.10.10"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

end

