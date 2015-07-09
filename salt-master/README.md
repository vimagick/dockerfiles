salt-master
===========

![](https://badge.imagelayers.io/vimagick/salt-master:latest.svg)

Salt is a new approach to infrastructure management. Easy enough to get running
in minutes, scalable enough to manage tens of thousands of servers, and fast
enough to communicate with them in seconds.

Salt delivers a dynamic communication bus for infrastructures that can be used
for orchestration, remote execution, configuration management and much more.

This image contains `salt-master`/`salt-ssh` and other power tools:

- curl
- httpie
- ipython
- jq
- vim-tiny

## network topology

- master
    - coreos: 192.168.1.1
- minions
    - arch: 192.168.1.100
    - debian: 192.168.1.101
    - ubuntu: 192.168.1.102

## docker-compose.yml

```
master:
  image: vimagick/salt-master
  ports:
    - "4505:4505"
    - "4506:4506"
  restart: always
```

## salt-master

```
$ cd ~/fig/salt/
$ docker-compose up -d
$ alias salt='docker exec -it salt_master_1 bash'
```

## salt-minion

```
# create roster
$ cat > /etc/salt/roster << _EOF_
arch:
    host: 192.168.1.100
    user: root
    passwd: XcAreP36
debian:
    host: 192.168.1.101
    user: root
    passwd: 0Q4yEQw7
ubuntu:
    host: 192.168.1.102
    user: root
    passwd: pc2wW6Dv
_EOF_

# deploy master key
$ salt-ssh -i --passwd xxxxxx --key-deploy '*' test.ping

# install salt-minion
$ salt-ssh '*' -r 'curl -L https://bootstrap.saltstack.com | sudo sh -s -- -A 192.168.1.1'

# list minion keys
$ salt-key -L

# accept minion keys
$ salt-key -y -A

# ping minions
$ salt '*' test.ping
```

## backup volumes

```
$ docker run --rm --volumes-from salt_master_1 -v `pwd`:/backup debian tar cvzf /backup/salt-$(date +%F).tgz /etc/salt/ /srv/salt/
$ ls -l
-rw-r--r-- 1 root root 14243 Jul  8 21:37 salt-2015-07-08.tgz
```

