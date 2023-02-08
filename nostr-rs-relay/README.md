nostr-rs-relay
==============

[A nostr relay][1], written in Rust. It currently supports the entire relay
protocol, and persists data with SQLite. There is experimental support for
Postgresql.

## Up and Running

```bash
$ mkdir -p data/{etc,var}
$ chmod 777 data/var
$ cd data/etc
$ wget https://github.com/scsibug/nostr-rs-relay/raw/master/config.toml
$ vim config.toml
$ docker-compose up -d
$ curl http://127.0.0.1:8080
```

[1]: https://github.com/scsibug/nostr-rs-relay
