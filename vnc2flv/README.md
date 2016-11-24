vnc2flv
=======

[Vnc2flv][1] is a cross-platform screen recording tool for UNIX, Windows or
Mac. It captures a VNC desktop session (either your own screen or a remote
computer) and saves as a Flash Video (FLV) file.

This docker image works very well with [selenium/standalone-firefox-debug][2].

## docker-compose.yml

```yaml
vnc2flv:
  image: vimagick/vnc2flv
  command: -P /pwdfile -o record.flv localhost 5900
  volumes:
    - ./pwdfile:/pwdfile
    - ./data:/data
  net: host
  stop_signal: SIGINT
```

## Up and Running

```bash
# Create passwd file
$ echo secret > pwdfile

# Start recording
$ docker-compose up -d

# Stop recording
$ docker-compose stop

# View logs
$ docker-compose logs
Attaching to vnc2flv_vnc2flv_1
vnc2flv_1  | start recording
vnc2flv_1  | stop recording
```

[1]: http://www.unixuser.org/~euske/python/vnc2flv/index.html
[2]: https://hub.docker.com/r/selenium/standalone-firefox-debug/
