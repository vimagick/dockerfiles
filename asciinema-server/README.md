asciinema-server
================

[asciinema-server][1] is a server-side component of the asciinema ecosystem.

## up and running

```bash
$ docker compose up -d
$ asciinema auth --server-url http://127.0.0.1:4000
$ asciinema rec demo.cast
...
^D
$ asciinema upload demo.cast
```

[1]: https://github.com/asciinema/asciinema-server
