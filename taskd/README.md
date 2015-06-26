`Taskwarrior` is Free and Open Source Software that manages your TODO list from
your command line. It is flexible, fast, efficient, and unobtrusive. It does
its job then gets out of your way.

## directory tree

```
~/fig/taskd/
├── docker-compose.yml
└── taskd/
    ├── ca.cert.pem
    ├── ca.key.pem
    ├── client.cert.pem
    ├── client.key.pem
    ├── config
    ├── orgs
    │   └── datageek
    │       ├── groups
    │       └── users
    │           └── 77b21131-e4b8-496a-a0e0-eafb75135221
    │               └── config
    ├── server.cert.pem
    ├── server.crl.pem
    └── server.key.pem
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
$ docker-compose up -d
$ docker exec -it taskd_taskd_1 sh
>>> taskd add org datageek
>>> taskd add user datageek kev
>>> exit
$ tree
```

## client

```
$ brew install task --with-gnutls
$ cd ~/.task
$ scp server:fig/taskd/taskd/{ca-cert,client-cert,client-key}.pem .
$ task sync init
```
