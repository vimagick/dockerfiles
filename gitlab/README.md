gitlab
======

[GitLab][1] includes Git repository management, code reviews, issue tracking,
wikis, and more, plus GitLab CI, an easy-to-use continuous integration and
deployment tool.

## docker-compose.yml

```
gitlab:
  image: gitlab/gitlab-ce
  hostname: git.example.com
  environment:
    GITLAB_OMNIBUS_CONFIG: |
      external_url 'https://git.example.com'
      nginx['redirect_http_to_https'] = true
  ports:
    - "22:22"
    - "80:80"
    - "443:443"
  volumes:
    - ./gitlab/config:/etc/gitlab
    - ./gitlab/logs:/var/log/gitlab
    - ./gitlab/data:/var/opt/gitlab
  restart: always
```

> You can put TLS crt+key into `./gitlab/config/ssl/`.

## up and running

```
$ vi /etc/ssh/sshd_config
- Port 22
+ Port 2222

$ systemctl restart ssh

$ docker-compose up -d

$ firefox https://git.example.com
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

## read more

- http://docs.gitlab.com/omnibus/docker/
- https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/settings/nginx.md

[1]: https://gitlab.com/
