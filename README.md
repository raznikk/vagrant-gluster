# Vagrant/Gluster test setup

## Introduction
A simple test setup for gluster using vagrant and the default CentOS 7 
repositories.

This system uses ansible playbooks to:
  - install dependencies
  - manage the firewall rules
  - update the base box
  - install and configure gluster
  - etc...


## Prerequisites
Vagrant DNS plugin: see https://github.com/vagrant-landrush/landrush


# Usage
The following assumes working knowledge of the command line for Linux/BSD-like
Operating Systems.

First, install landrush:

    $> vagrant plugin install landrush

Once that is done:

    $> git clone https://github.com/raznikk/vagrant-gluster.git
    $> cd vagrant-gluster
    $> vagrant up

Once done, you should be able to play around with gluster to your heart's
content.

