minio
=====

[Minio][1] is an object storage server released under Apache License v2.0. It is
compatible with Amazon S3 cloud storage service. It is best suited for storing
unstructured data such as photos, videos, log files, backups and container / VM
images. Size of an object can range from a few KBs to a maximum of 5TB.

Minio server is light enough to be bundled with the application stack, similar
to NodeJS, Redis and MySQL.

## docker-compose.yml

```yaml
minio:
  image: minio/minio
  command: server /data
  ports:
    - "9000:9000"
  volumes:
    - ./data:/data
    - ./conf:/root/.minio
  restart: always
```

## Quick Start

Download minio client:

- [linux/amd64][2]
- [linux/386][3]
- [linux/arm][4]

Read minio [tutorial][5].

```bash
$ docker-compose up -d
$ cat ./conf/config.json
# "accessKey": "XXXXXXXXXXXXXXXXXXXX",
# "secretKey": "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
$ curl http://127.0.0.1:9000

$ mc config host add minio http://127.0.0.1:9000 XXXXXXXXXXXXXXXXXXXX YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
$ mc mb minio/test
$ mc cp README.md minio/test
$ mc cat minio/test/README.md
$ mc ls -r minio
$ mc rm minio/test/README.md
$ mc rm minio/test
```

[1]: https://minio.io/
[2]: https://dl.minio.io/client/mc/release/linux-amd64/mc
[3]: https://dl.minio.io/client/mc/release/linux-386/mc
[4]: https://dl.minio.io/client/mc/release/linux-arm/mc
[5]: https://docs.minio.io/docs/minio-client-quickstart-guide
