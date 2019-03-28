#!/bin/sh

# Use centos user instead of cloud-user for Centos7
mkdir /home/centos/.ssh
cat /tmp/scripts/key_name.pem.pub >> /home/centos/.ssh/authorized_keys
