```
# install virtualbox
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib non-free" > /etc/apt/sources.list.d/virtualbox.list
wget -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | apt-key add -
apt-get update
apt-get install virtualbox-5.0
systemctl status vboxdrv

# install extpack
wget http://download.virtualbox.org/virtualbox/5.0.20/Oracle_VM_VirtualBox_Extension_Pack-5.0.20-106931.vbox-extpack
VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.0.20-106931.vbox-extpack
VBoxManage list extpacks

# install vagrant
wget https://releases.hashicorp.com/vagrant/1.8.4/vagrant_1.8.4_x86_64.deb
dpkg -i vagrant_1.8.4_x86_64.deb
vagrant version

# start vm
vagrant init debian/jessie64
vagrant up
```
