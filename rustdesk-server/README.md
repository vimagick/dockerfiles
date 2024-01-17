rustdesk-server
===============

Self-host your own [RustDesk server][1], it is free and open source.

## up and running

```bash
$ docker run --rm --entrypoint /usr/bin/rustdesk-utils  rustdesk/rustdesk-server-s6 genkeypair
Public Key:  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Secret Key:  YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

$ mkdir -p data
$ echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" > data/id_ed25519.pub
$ echo "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY" > data/id_ed25519

$ docker compose up -d
```

[1]: https://github.com/rustdesk/rustdesk-server
