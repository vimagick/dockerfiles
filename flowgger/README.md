flowgger
========

[Flowgger][1] is a fast, simple and lightweight data collector written in Rust.

```bash
$ docker-compose up -d
$ echo "<34>Oct 11 22:14:15 mymachine su: 'su root' failed for lonvick on /dev/pts/8" | nc -v -u -w 0 127.0.0.1 514
```

[1]: https://github.com/awslabs/flowgger
