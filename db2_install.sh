#!/usr/bin/env bash

# sed -i "s/SELINUX=enforcing.*/SELINUX=permissive/g" /etc/selinux/config
yum update -y
yum group install -y "Development Tools" 
yum install -y vim

tar -zxvf /vagrant/v11.1_linuxx64_expc.tar.gz -C /vagrant
(echo 'yes'; echo 'yes') | /vagrant/expc/db2_install 

useradd db2inst1
(echo 'passw0rd'; echo 'passw0rd') | passwd db2inst1

/opt/ibm/db2/V11.1/instance/db2icrt -p 50000 -u db2inst1 db2inst1
