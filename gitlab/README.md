gitlab
======

[GitLab][1] includes Git repository management, code reviews, issue tracking,
wikis, and more, plus GitLab CI, an easy-to-use continuous integration and
deployment tool.

## docker-compose.yml

```yaml
gitlab:
  image: gitlab/gitlab-ce
  hostname: git.example.com
  environment:
    GITLAB_OMNIBUS_CONFIG: |
      external_url 'https://git.example.com'
      gitlab_rails['gitlab_shell_ssh_port'] = 2222
  ports:
    - "443:443"
    - "2222:22"
  volumes:
    - ./gitlab/config:/etc/gitlab
    - ./gitlab/logs:/var/log/gitlab
    - ./gitlab/data:/var/opt/gitlab
  restart: always
```

You can put TLS crt+key into `./gitlab/config/ssl/`:

- `git.example.com.crt`
- `git.example.com.key`

If you bind port 22, you need to change host `sshd` config:

```bash
$ vi /etc/ssh/sshd_config
- Port 22
+ Port 2222
$ systemctl restart ssh
$ ssh -p 2222 localhost
```

## up and running

```bash
$ mkdir -p ~/fig/gitlab/gitlab/config/ssh
$ cd ~/fig/gitlab/gitlab/config/ssh
$ openssl req -newkey rsa:4096 -nodes -sha256 -x509 -days 365 \
              -keyout git.example.com.key \
              -out git.example.com.crt
$ docker-compose up -d
```

Open <https://git.example.com> in your web browser:

- username: `root`
- password: `5iveL!fe`

## backup volumes

```bash
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
- https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/settings/configuration.md

[1]: https://gitlab.com/
