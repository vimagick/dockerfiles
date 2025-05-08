moonfire-nvr
============

[Moonfire NVR][1] is an open-source security camera network video recorder.

## up and running

```bash
$ mkdir -p data/{etc,var,tmp}
$ chown -R 1000:1000 data
$ docker compose run --rm moonfire-nvr init
$ docker compose run --rm moonfire-nvr config
$ docker compose up -d
$ open http://127.0.0.1:8080/
```

[1]: https://github.com/scottlamb/moonfire-nvr
