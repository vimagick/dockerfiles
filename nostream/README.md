nostream
========

[Nostream][1] is a nostr relay, written in Typescript.

## Up and Running

```bash
$ mkdir -p data/{nostream,redis,postgres}
$ cd data/nostream
$ wget https://github.com/Cameri/nostream/raw/main/resources/default-settings.yaml -O settings.yaml
$ vim settings.yaml
$ docker-compose up -d
$ curl http://127.0.0.1:8008
```

[1]: https://github.com/Cameri/nostream
