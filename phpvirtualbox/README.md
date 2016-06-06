phpVirtualBox
=============

[phpVirtualBox][1] is a web-based front-end to VirtualBox written in PHP.

### docker-compose.yml

```yaml
phpvirtualbox:
  image: jazzdd/phpvirtualbox
  ports:
    - "8888:80"
  environment:
    - ID_PORT_18083_TCP=remote-server:18083
    - ID_NAME=Vbox
    - ID_USER=username
    - ID_PW=password
    - CONF_browserRestrictFolders=/data,
  restart: always
```

> - Make sure you can login `remote-server` with `username:password`.
> - ISO images can be placed at `/data` directory of `remote-server`.
> - During the OS installation, you can connect it with RDC program.

### vboxweb.service

```
# /etc/systemd/system/vboxweb.service
[Unit]
Description=VirtualBox Web Service
After=network.target

[Service]
ExecStart=/usr/bin/vboxwebsrv -H 0.0.0.0 -p 18083
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

### server setup

```bash
# install virtualbox
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib non-free" > /etc/apt/sources.list.d/virtualbox.list
curl http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | apt-key add
apt-get update
apt-get install virtualbox-5.0
systemctl status vboxdrv

# install extpack
wget http://download.virtualbox.org/virtualbox/5.0.20/Oracle_VM_VirtualBox_Extension_Pack-5.0.20-106931.vbox-extpack
VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-5.0.20-106931.vbox-extpack
VBoxManage list extpacks

# install vagrant
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
dpkg -i vagrant_1.8.1_x86_64.deb
vagrant version

# start vm
vagrant init debian/jessie64
vagrant up

# disable vboxweb-service
systemctl stop vboxweb-service
systemctl disable vboxweb-service

# enable vboxweb
systemctl daemon-reload
systemctl start vboxweb
systemctl enable vboxweb
```

[1]: http://sourceforge.net/projects/phpvirtualbox/
