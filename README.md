# DB2 Vagrant CentOS 7

Install and setup DB2 express version on CentOS 7

## How to use

There is very little changes in the Vagrantfile. DB2 installation is done via db2_install.sh
- Vagrantfile has a line for private network, it uses DHCP for assigning IP address, you can update it to suit your needs


### Steps
- Download `v11.1_linuxx64_expc.tar.gz` from [IBM DB2](https://www.ibm.com/analytics/us/en/technology/db2/db2-trials.html)
  - Make sure update the name of db2 installation file in db2_install.sh
- Place the installation package at the same dir as `db2_install.sh`
- On host system, `cd db2` then run `vagrant up`
- SSH into vagrant box using `vagrant ssh`
- We need to disable SELINUX or set it to permissive mode otherwise DB2 installation will show error. So switch to `root` with `sudo su -`, then run `sed -i "s/SELINUX=enforcing.*/SELINUX=permissive/g" /etc/selinux/config; reboot`, this will change selinux to permissive mode and reboot the system to make change to SELINUX take effect
- Once the system is come back up, run `sudo sh /vagrant/db2_install.sh`, this will install db2 and db2 dependences
  - db2 username: `db2inst1`
  - password: `passw0rd`
- Switch to `db2inst1` user with `su - db2inst1`, then run `db2start` will start the db2
- If you want to create a DB2 sample database, run `db2sampl`
