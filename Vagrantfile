# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = true
  config.vm.synced_folder "./", "/vagrant"
  config.ssh.insert_key = false
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end
  
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "playbooks/default.yml"
    ansible.sudo = true
  end

  config.vm.define "master" do |master|
    master.vm.network "private_network", ip: "192.168.100.254"
  end

  config.vm.define "slave1" do |slave1|
    slave1.vm.network "private_network", ip: "192.168.100.100"
  end

#  config.vm.define "epel" do |epel|
#    epel.vm.provision :ansible do |ans|
#      ans.playbook = "playbooks/test/epel-test.yml"
#      ans.sudo = true
#    end
#  end
 
end
