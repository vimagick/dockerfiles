rslsync
=======

[Resilio Sync][1] is a fast, simple, and secure file syncing for IT and individuals.

## docker-compose.yml

```yaml
rslsync:
  image: vimagick/rslsync
  ports:
    - "8888:8888"
    - "55555:55555"
  volumes:
    - ./data:/data
    - ./rslsync.json:/etc/rslsync.json
  restart: always
```

## rslsync.json

```json
{
  "device_name": "Resilio Sync Server",
  "listening_port": 55555,
  "storage_path": "/data/system",
  "pid_file": "/var/run/rslsync.pid",
  "use_upnp": false,
  "download_limit": 0,
  "upload_limit": 0,
  "directory_root": "/data/user",
  "directory_root_policy": "all",
  "webui": {
    "listen": "0.0.0.0:8888",
    "login": "admin",
    "password": "admin"
  }
}
```

> Please change the default login/password.

## up and running

```bash
$ docker-compose run --rm rslsync rslsync --dump-sample-config > rslsync.json
$ vi rslsync.json
$ docker-compose up -d
```

[1]: https://getsync.com/
