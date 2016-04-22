gitlab
======

## docker-compose.yml

```
gitlab:
  image: gitlab/gitlab-ce
  ports:
    - "22:22"
    - "80:80"
    - "443:443"
  restart: always
```

## up and running

```
$ vi /etc/ssh/sshd_config
- Port 22
+ Port 2222
$ systemctl restart ssh

$ docker-compose up -d
$ docker-compose exec gitlab bash
>>> vi /etc/gitlab/gitlab.rb
+   external_url 'http://your-domain-name'
>>> gitlab-ctl reconfigure
>>> exit

$ firefox http://your-domain-name
```

## backup volumes

```
$ docker run --rm \
             --volumes-from gitlab_gitlab_1 \
             -v $PWD:/tmp \
             alpine \
             tar czf /tmp/gitlab.tgz /etc/gitlab /var/opt/gitlab /var/log/gitlab

$ tar tzf gitlab.tgz
```
