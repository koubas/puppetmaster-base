# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian-7.7.0-amd64"
  config.vm.box_url = "https://github.com/kraksoft/vagrant-box-debian/releases/download/7.7.0/debian-7.7.0-amd64.box"
  config.vm.network "private_network", ip: "192.168.65.5"
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.provision "shell" do |s|
    s.path = "vagrant-puppet/shell/initial-setup.sh"
  end
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "vagrant-puppet/manifests"
    puppet.module_path    = "vagrant-puppet/modules"
    puppet.manifest_file  = "vagrant.pp"
  end
end
