# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
N = 3
DISK = 'disk2.vdi'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos/7"
  config.vm.box_check_update = true

  # Currently broken with Vagrant 1.8.5, at least on Mac OS
  config.ssh.insert_key = false

  # Folder Synchronization is somewhat important for developing
  config.vm.synced_folder "./", "/vagrant"

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

      server.vm.provider "virtualbox" do |vb|
        vb.customize ["createhd",  "--filename", ".disks/machine#{machine_id}_disk0", "--size", "4096"]
        vb.customize ["storagectl", :id, "--name", "SATA Controller", "--add", "sata"]
        vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "2", "--type", "hdd", "--medium", ".disks/machine#{machine_id}_disk0.vdi"]
      end

      if machine_id == N
        server.vm.provision :ansible do |ansible|
          ansible.sudo = true
          ansible.limit = "all"
          ansible.playbook = 'playbooks/gluster.yml' 
        end
      end

    end
  end
    
end
