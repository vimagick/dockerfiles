croc
====

[croc][1] is a tool that allows any two computers to simply and securely transfer
files and folders.

## Server

```bash
$ CROC_PASS=hackme croc relay
[info]	2023/02/23 10:29:50 starting croc relay version v9.6.0-0e93f1e
[info]	2023/02/23 10:29:50 starting TCP server on :9009
[info]	2023/02/23 10:29:50 starting TCP server on :9010
[info]	2023/02/23 10:29:50 starting TCP server on :9011
[info]	2023/02/23 10:29:50 starting TCP server on :9012
[info]	2023/02/23 10:29:50 starting TCP server on :9013
```

## Client A (sender)

```bash
$ export CROC_RELAY=1.2.3.4:9009
$ export CROC_PASS=hackme

$ seq 10 > test.txt

$ croc send test.txt
Sending 'test.txt' (21 B)
Code is: 1234-what-the-hack
```

## Client B (receiver)

```bash
$ export CROC_RELAY=1.2.3.4:9009
$ export CROC_PASS=hackme

$ croc 1234-what-the-hack
Accept 'test.txt' (21 B)? (Y/n)
```

[1]: https://github.com/schollz/croc
