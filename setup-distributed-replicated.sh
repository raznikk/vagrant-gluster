#!/usr/bin/env bash

#
# Command line argument: name of the volume
#

vagrant ssh server1 -c "sudo gluster peer probe server2; sudo gluster peer probe server3"
bin/dssh "sudo mkdir /gluster/brick{1..3}/brick 2&>1 >/dev/null"
vagrant ssh server1 -c "sudo gluster volume create $1 replica 3 server1:/gluster/brick1/brick server2:/gluster/brick1/brick server3:/gluster/brick1/brick server1:/gluster/brick2/brick server2:/gluster/brick2/brick server3:/gluster/brick2/brick"
vagrant ssh server1 -c "sudo gluster volume start $1"
