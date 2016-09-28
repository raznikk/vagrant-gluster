# Vagrant/Gluster test setup

A simple test setup for gluster using vagrant and the default CentOS 7 
repositories.

This system uses ansible playbooks to:
  - install dependencies
  - manage the firewall rules
  - update the base box
  - install and configure gluster
  - etc...

# Usage

The following assumes working knowledge of the command line for Linux/BSD-like
Operating Systems.

    $> git clone https://github.com/raznikk/vagrant-gluster.git
    $> cd vagrant-gluster
    $> vagrant up

Once done, you should be able to play around with gluster to your heart's
content.
