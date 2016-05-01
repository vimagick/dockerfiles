taskd
=====

[![](https://badge.imagelayers.io/vimagick/taskd:latest.svg)](https://imagelayers.io/?images=vimagick/taskd:latest)

`Taskwarrior` is Free and Open Source Software that manages your TODO list from
your command line. It is flexible, fast, efficient, and unobtrusive. It does
its job then gets out of your way.

## directory tree

```
~/fig/taskd/
├── docker-compose.yml
├── setup.sh*
└── taskd/
    ├── ca.cert.pem
    ├── ca.key.pem
    ├── client.cert.pem
    ├── client.key.pem
    ├── config
    ├── orgs/
    │   └── datageek/
    │       ├── groups/
    │       └── users/
    │           └── cf31f287-ee9e-43a8-843e-e8bbd5de4294/
    │               └── config
    ├── pki/
    │   ├── generate*
    │   ├── generate.ca*
    │   ├── generate.client*
    │   ├── generate.crl*
    │   ├── generate.server*
    │   ├── README
    │   └── vars
    ├── server.cert.pem
    ├── server.crl.pem
    ├── server.key.pem
    └── users/
        ├── kev.cert.pem
        └── kev.key.pem
```

## server setup

```
#!/bin/bash
#
# setup taskd server
#

mkdir -p ~/fig/taskd/taskd/{orgs,users}
cd ~/fig/taskd/taskd/

wget -O- http://taskwarrior.org/download/taskd-1.1.0.tar.gz |
    tar xvz --strip 1 taskd-1.1.0/pki

cd pki
vim vars
./generate
./generate.client kev
mv kev.* ../users
mv *.pem ..
cd ..

cat > config << _EOF_
confirmation=1
extensions=/usr/libexec/taskd
ip.log=on
log=/dev/stdout
pid.file=/run/taskd.pid
queue.size=10
request.limit=1048576
root=/var/taskd
server=0.0.0.0:53589
trust=strict
verbose=1
client.cert=/var/taskd/client.cert.pem
client.key=/var/taskd/client.key.pem
server.cert=/var/taskd/server.cert.pem
server.key=/var/taskd/server.key.pem
server.crl=/var/taskd/server.crl.pem
ca.cert=/var/taskd/ca.cert.pem
_EOF_
```

## docker-compose.yml

```
taskd:
  image: vimagick/taskd
  ports:
    - "53589:53589"
  volumes:
    - taskd:/var/taskd
  restart: always
```

## server

```
$ cd ~/fig/taskd/
$ ./setup.sh
$ docker-compose up -d
$ docker exec -it taskd_taskd_1 sh
>>> taskd add org datageek
    Created organization 'datageek'
>>> taskd add user datageek kev
    New user key: cf31f287-ee9e-43a8-843e-e8bbd5de4294
    Created user 'kev' for organization 'datageek'
>>> exit
$ tree -F
```

## client

```
$ brew install task --with-gnutls
$ cd ~/.task
$ scp jp:fig/taskd/taskd/{ca.cert,users/kev.*}.pem .
$ task config taskd.certificate -- ~/.task/kev.cert.pem
$ task config taskd.key         -- ~/.task/kev.key.pem
$ task config taskd.ca          -- ~/.task/ca.cert.pem
$ task config taskd.server      -- easypi.info:53589
$ task config taskd.credentials -- datageek/kev/cf31f287-ee9e-43a8-843e-e8bbd5de4294
$ task config taskd.trust       -- ignore hostname
$ task sync init
```
