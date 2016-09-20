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
    - ./rslsync.conf:/etc/rslsync.conf
  restart: always
```

## rslsync.conf

```json
{
  "device_name": "My Sync Device",
  "listening_port": 55555,
  "storage_path": "/data/.syncsystem",
  "pid_file": "/var/run/rslsync.pid",
  "use_upnp": false,
  "download_limit": 0,
  "upload_limit": 0,
  "directory_root": "/data/syncaod",
  "directory_root_policy": "all",
  "webui": {
    "listen": "0.0.0.0:8888"
  }
}
```

## up and running

```bash
$ docker-compose run --rm rslsync --dump-sample-config > rslsync.conf
$ docker-compose up -d
```

[1]: https://getsync.com/
