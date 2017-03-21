# DB2 Vagrant CentOS 7

Install and setup DB2 express version on CentOS 7

## How to use

There is very little changes in the Vagrantfile. DB2 installation is done via db2_install.sh

### Step
- Download `v11.1_linuxx64_expc.tar.gz` from [IBM DB2](https://www.ibm.com/analytics/us/en/technology/db2/db2-trials.html)
  - Make sure update the file name in db2_install.sh
- Place the package in the same dir as `db2_install.sh`
- On host system, `cd db2` then run `vagrant up`
- `vagrant ssh`, then switch to `root` with `sudo su -` and then run `sed -i "s/SELINUX=enforcing.*/SELINUX=permissive/g" /etc/selinux/config; reboot`, this will change selinux to permissive mode and reboot the system to make change to SELINUX take effect
- Once the system is come back up, run `sudo sh /vagrant/db2_install.sh`, this will install db2 and db2 dependences
  -db2 user created is `db2inst1`, password is `passw0rd`
- Switch to db2inst1 user with `su - db2inst1`, then run `db2start;db2sampl` will start the db2 and create db2 sample database.
