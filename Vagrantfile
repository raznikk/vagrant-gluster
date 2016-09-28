# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
N = 3

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos/7"
  config.vm.box_check_update = true

  # Currently broken with Vagrant 1.8.5, at least on Mac OS
  config.ssh.insert_key = false

  # Folder Synchronization is somewhat important for developing
  config.vm.synced_folder "./", "/vagrant"

  # Enable landrush
  config.landrush.enabled = true
  config.landrush.tld = "gluster.dev"

  #===
  # VirtualBox provider
  #===
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end
  
  #===
  # Set up Servers
  #===
  (1..N).each do |machine_id|
    config.vm.define "server#{machine_id}" do |server|
      server.vm.hostname = "server#{machine_id}.gluster.dev"
      server.vm.network :private_network, ip: "172.16.17.#{100+machine_id}"
      server.landrush.host_interface = 'eth1'

      if machine_id == N
        server.vm.provision :ansible do |ansible|
          ansible.sudo = true
          ansible.limit = "all"
          ansible.playbook = 'playbooks/default.yml' 
        end
      end

      #server.vm.provision :ansible_local do |ansible|
      #  ansible.sudo = true
      #  ansible.playbook = 'playbooks/server.yml'
      #end
    end
  end
    
  #===
  # Base Ansible configuration
  #===
  #config.vm.provision :ansible do |ansible|
  #  ansible.playbook = "playbooks/default.yml"
  #  ansible.sudo = true
  #end

  #===
  # "Master" server
  #===
  #config.vm.define "master" do |master|
  #  master.vm.network "private_network", ip: "172.16.17.1"
  #  master.vm.hostname = 'master.gluster.dev'
  #  master.landrush.host_interface = "eth1"
  #end

  #===
  # "Slave" servers
  #===
  #config.vm.define "slave1" do |servera|
  #  servera.vm.network "private_network", ip: "172.16.17.101"
  #  servera.vm.hostname = 'servera.gluster.dev'
  #  servera.landrush.host_interface = "eth1"
  #end

#  config.vm.define "epel" do |epel|
#    epel.vm.provision :ansible do |ans|
#      ans.playbook = "playbooks/test/epel-test.yml"
#      ans.sudo = true
#    end
#  end
 
end
