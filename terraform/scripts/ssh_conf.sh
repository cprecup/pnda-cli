#!/bin/sh
adduser centos
passwd -d centos
echo "%centos ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/centos
