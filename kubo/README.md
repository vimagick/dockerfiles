kubo
====

[Kubo][1] (go-ipfs) the earliest and most widely used implementation of IPFS.

```bash
$ mkdir -p data/{export,ipfs}
$ chown -R 1000:100 data
$ docker-compose up -d
$ curl http://127.0.0.1:5001/webui/
```

```bash
$ docker-compose exec kubo sh
>>> cd /export
>>> echo "hello world" > hello.txt
>>> ipfs add hello.txt
added QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o hello.txt
 12 B / 12 B [=======================================] 100.00%
>>> ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
hello world
>>> exit
```

[1]: https://github.com/ipfs/kubo
