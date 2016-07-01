openssh
=======

## docker-compose.yml

```yaml
openssh:
  image: vimagick/openssh
  hostname: alpine
  ports:
    - "2222:22"
  volumes:
    - ./keys:/root/.ssh/keys
  restart: always
```

## up and running

```bash
$ cd ~/fig/openssh/

$ tree keys
├── joe.pub
├── kev.pub
└── tom.pub

$ docker-compose up -d
```

## ssh login

```bash
$ ssh -p 2222 root@server
```
