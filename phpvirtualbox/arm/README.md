phpvirtualbox
=============

This is a fork of [jazzdd86/phpvirtualbox](https://hub.docker.com/r/jazzdd/phpvirtualbox/).

[phpVirtualBox][1] is a modern web interface that allows you to control remote
VirtualBox instances - mirroring the VirtualBox GUI.

## docker-compose.yml

```yaml
phpvirtualbox:
  image: easypi/phpvirtualbox-arm
  ports:
    - "8888:80"
  environment:
    - ID_PORT_18083_TCP=remote-server:18083
    - ID_NAME=Vbox
    - ID_USER=username
    - ID_PW=password
    - CONF_browserRestrictFolders=/data,
  restart: always
```

## screenshot

![][2]

[1]: http://sourceforge.net/projects/phpvirtualbox/
[2]: http://a.fsdn.com/con/app/proj/phpvirtualbox/screenshots/phpvb1.png
