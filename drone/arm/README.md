drone-arm
=========

## Deploy Key Setup

```yaml
drone:
    Settings > Public Key: ssh-rsa ...

gogs:
    Settings > Add Deploy Key:
        Title: drone
        Content: ssh-rsa ...
```

## Server Setup

```
$ cat /boot/cmdline.txt
$ sed -i '1s/$/ cgroup_enable=cpuset/' /boot/cmdline.txt
$ reboot
```

## Client Setup

```
# install drone-cli
$ curl http://downloads.drone.io/drone-cli/drone_darwin_amd64.tar.gz | tar zx -C /usr/local/bin/
$ export DRONE_SERVER=https://drone.easypi.info
$ export DRONE_TOKEN=xxxxxxxx

# create .drone.yml
$ git clone git@git.easypi.info:EasyPi/docker-shadowsocks-libev.git
$ cd docker-shadowsocks-libev
$ git remote add github git@github.com:EasyPi/docker-shadowsocks-libev.git
$ git remote add bitbucket git@bitbucket.org:EasyPi/docker-shadowsocks-libev.git
$ vi -p .drone.yml secrets.yml
$ echo 'secrets.yml' >> .gitignore
$ drone secure --repo EasyPi/docker-shadowsocks-libev --in secrets.yml
$ git add .gitignore .drone.yml .drone.sec
$ git commit -m 'Add .drone.yml'
$ git push -u origin master
$ git push -u github master
$ git push -u bitbucket master
```

> You need to re-generate `.drone.sec` after editing `.drone.yml`.

File: .drone.yml

```yaml
publish:
  docker:
#   environment:
#       - DOCKER_LAUNCH_DEBUG=true
    username: $$DOCKER_USER
    password: $$DOCKER_PASS
    email: $$DOCKER_EMAIL
    file: Dockerfile.arm
    repo: easypi/shadowsocks-libev-arm
    tag:
      - latest
      - 2.4.8
```

File: secrets.yml

```yaml
environment:
  DOCKER_USER: noreply
  DOCKER_PASS: ********
  DOCKER_EMAIL: noreply@easypi.pro
```

## read more

- <http://readme.drone.io/setup/overview/>
- <http://readme.drone.io/plugins/>
- <http://readme.drone.io/devs/cli/>
- <https://github.com/drone-plugins/drone-docker/blob/master/DOCS.md>
- <https://gist.github.com/philipz/1e7a36560700fdc1ad63>
- <http://a.frtzlr.com/kubernetes-on-raspberry-pi-3-the-missing-troubleshooting-guide/>
