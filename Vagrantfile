# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 8080, host: 80

config.vm.provider "virtualbox" do |v|
  v.memory = 2048
  v.cpus = 1
end

  config.vm.synced_folder ".", "/home/vagrant/" 

config.vm.provision "shell" do |s|
    s.path = ".provision/setup.sh"
end

end