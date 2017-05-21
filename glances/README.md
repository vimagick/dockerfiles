glances
=======

[Glances][1] an Eye on your system. A top/htop alternative.

## docker-compose.yml

```yaml
glances:
  image: vimagick/glances
  volumes:
    - ./data:/etc/glances
    - /var/run/docker.sock:/var/run/docker.sock:ro
  environment:
    - GLANCES_OPT=-w
  net: host
  pid: host
  restart: always
```

> Read [this][2] for all command line options.

## up and running

```bash
$ docker-compose up -d
$ curl http://localhost:61208
```

> You can put settings in [./data/glances.conf][3].

## screenshot

![](http://glances.readthedocs.io/en/stable/_images/screenshot-wide.png)

[1]: http://nicolargo.github.io/glances/
[2]: http://glances.readthedocs.io/en/stable/cmds.html
[3]: http://glances.readthedocs.io/en/stable/config.html
