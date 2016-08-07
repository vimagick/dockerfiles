pxe
===

The Preboot Execution Environment (PXE) is an environment to bootstrap
computers using a network card (i.e Ethernet, Token-Ring) independently of
available data storage devices (like hard disks) or installed operating
systems.

## docker-compose.yml

```yaml
pxe:
  image: vimagick/dnsmasq
  net: host
  volumes:
    - ./dnsmasq.conf:/etc/dnsmasq.d/dnsmasq.conf
    - ./tftpboot:/tftpboot
  restart: always

web:
  image: nginx:alpine
  ports:
    - "80:80"
  volumes:
    - ./nginx.conf:/etc/nginx/nginx.conf
    - ./html:/var/lib/nginx/html
  restsart: always
```

> :warning: The local mirror doesn't work!

## dnsmasq.conf

```
interface=eth0
port=0
no-hosts
no-resolv
server=8.8.8.8
dhcp-range=192.168.1.10,192.168.1.20,1h,proxy
dhcp-option=3,192.168.1.1
dhcp-option=6,192.168.1.1
dhcp-boot=pxelinux.0
enable-tftp
tftp-root=/tftpboot
```

> You can get all `dhcp-option` codes via `dnsmasq --help dhcp`.

## nginx.conf

```
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    server {
        listen       80;
        server_name  localhost;
        location / {
            root   html;
            index  index.html index.htm;
            autoindex on;
        }
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}
```

## up and running

```bash
cd ~/fig/pxe/

mkdir tftpboot
wget http://ftp.nl.debian.org/debian/dists/jessie/main/installer-amd64/current/images/netboot/netboot.tar.gz
tar xzf netboot.tar.gz -C tftpboot

mkdir html
wget http://cdimage.debian.org/debian-cd/8.5.0/amd64/iso-cd/debian-8.5.0-amd64-CD-1.iso
mount debian-8.5.0-amd64-CD-1.iso html

docker-compose up -d
docker-compose logs -f
```

> You should stop DHCP service on local network before starting PXE.
> Also take a look at `preseed.cfg` for unattended installation.
