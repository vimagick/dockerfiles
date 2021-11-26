etcd
=====

[etcd][1] is a distributed, reliable key-value store for the most critical data
of a distributed system.

```bash
$ docker-compose up -d
$ docker-compose exec etcd bash
>>> etcdctl version
etcdctl version: 3.5.1
API version: 3.5
>>> etcdctl put foo bar
OK
>>> etcdctl gut foo
foo
bar
```

[1]: https://etcd.io/
