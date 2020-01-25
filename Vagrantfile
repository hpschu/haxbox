# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "debian/buster64"
    config.vm.synced_folder "data", "/data"

    # Provision basic tools to installation
    config.vm.provision "shell", path: "ubuntu/provision-tools-basic.sh"

    config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.memory = "1024"
  end

end
