#!/bin/sh

# Use centos user instead of cloud-user for Centos7
adduser centos
passwd -d centos
echo "%centos ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/centos
