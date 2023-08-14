#!/bin/bash
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum --enablerepo="elrepo-kernel" list --showduplicates | sort -r | grep kernel-*.x86_64
yum --enablerepo=elrepo-kernel install  kernel-ml-devel kernel-ml -y
yum --enablerepo=elrepo-kernel install  kernel-lt-devel kernel-lt -y
yum update -y
awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg
grub2-set-default 0
grub2-mkconfig -o /boot/grub2/grub.cfg
