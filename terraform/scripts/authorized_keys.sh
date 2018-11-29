#!/bin/sh
mkdir /home/centos/.ssh
cat /tmp/scripts/key_name.pem.pub >> /home/centos/.ssh/authorized_keys
