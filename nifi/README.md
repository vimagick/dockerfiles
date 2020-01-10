nifi
====

[Apache nifi][1] is an easy to use, powerful, and reliable system to process
and distribute data.

![](https://nifi.apache.org/assets/images/flow-th.png)


## up and running

```bash
$ docker-compose up -d
$ chown -R 1000:1000 data
$ docker-compose restart
$ curl http://127.0.0.1:8080
```

[1]: https://nifi.apache.org
