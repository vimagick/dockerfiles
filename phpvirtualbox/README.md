phpVirtualBox
=============

This is a fork of [jazzdd86/phpvirtualbox](https://hub.docker.com/r/jazzdd/phpvirtualbox/).

[phpVirtualBox][1] is a web-based front-end to VirtualBox written in PHP.

## up and running

```bash
$ mkdir -p data
$ wget -O data/config.php https://github.com/phpvirtualbox/phpvirtualbox/raw/refs/heads/develop/config.php-example
$ vim data/config.php
$ docker compose up -d
```

Important settings:

- `$username / $password`: Username / Password for system user that runs VirtualBox 
- `$location = 'http://vboxwebsrv:18083/'`: SOAP URL of vboxwebsrv
- `$vrdeaddress = '0.0.0.0'`: Set the default VRDE address
- `$browserRestrictFolders = array('/data')`: Restrict locations / folders
- `$noAuth = false`: WebUI users are stored as global extradata (`VBoxManage getextradata global enumerate`)
  - Key: phpvb/users/admin/admin
  - Value: 1
  - Key: phpvb/users/admin/pass
  - Value: (sha512sum)

## windows host setup

```pwsh
C:\> echo %PATH%
...;C:\Program Files\Oracle\VirtualBox\;...

C:\> vboxwebsrv -H 0.0.0.0 >nul
Oracle VirtualBox web service Version 7.2.20
Copyright (C) 2007-2026 Oracle and/or its affiliates
```

## linux server setup

<details>
<summary>vboxweb.service</summary>

```ini
# /etc/systemd/system/vboxweb.service

[Unit]
Description=VirtualBox Web Service
After=network.target

[Service]
ExecStart=/usr/bin/vboxwebsrv -H 0.0.0.0 -p 18083 -F /var/log/vboxwebsrv.log
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
</details>

```bash
# install virtualbox
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" > /etc/apt/sources.list.d/virtualbox.list
wget -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | apt-key add -
apt-get update
apt-get install -y virtualbox-7.2 dkms
systemctl status vboxdrv

# install extpack
wget https://download.virtualbox.org/virtualbox/7.2.20/Oracle_VirtualBox_Extension_Pack-7.2.20.vbox-extpack
VBoxManage extpack install Oracle_VirtualBox_Extension_Pack-7.2.20.vbox-extpack
VBoxManage list extpacks

# install vagrant
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant

# start vm
vagrant box add debian/jessie64
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

> [!Tip]
> Click [here][2] to get a list of vagrant images

[1]: http://sourceforge.net/projects/phpvirtualbox/
[2]: https://portal.cloud.hashicorp.com/vagrant/discover
