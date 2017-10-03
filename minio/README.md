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

## Server

```bash
$ docker-compose up -d
$ cat ./conf/config.json
# "accessKey": "XXXXXXXXXXXXXXXXXXXX",
# "secretKey": "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
$ curl -u XXXXXXXXXXXXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY http://127.0.0.1:9000
```

## Client

Download minio client:

- [linux/amd64][2]
- [linux/386][3]
- [linux/arm][4]

Read minio [tutorial][5].

```bash
$ mc config host add minio http://127.0.0.1:9000 XXXXXXXXXXXXXXXXXXXX YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
$ mc mb minio/test
$ mc cp README.md minio/test
$ mc cat minio/test/README.md
$ mc ls -r minio
$ mc rm minio/test/README.md
$ mc rm minio/test
```

## Client (Android)

```bash
$ termux-setup-storage
$ realpath ~/storage/dcim
/storage/emulated/0/DCIM
$ cd ~/storage/dcim/Camera
$ termux-camera-photo -c 0 back.jpg
$ termux-camera-photo -c 1 front.jpg

$ go get -u github.com/minio/mc
$ mc config host add minio http://127.0.0.1:9000 XXXXXXXXXXXXXXXXXXXX YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
$ mc mb minio/android
$ mc mirror --force --remove --watch /storage/emulated/0/DCIM/Camera/ minio/android/camera
```

```bash
$ pwd
/data/data/com.termux/files/home

$ cat >> .bashrc << _EOF_
export TMPDIR=/data/data/com.termux/files/usr/tmp
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
export RESTIC_REPOSITORY=s3:http://192.168.1.104:9000/android
export RESTIC_PASSWORD=ZZZZZZZZ
_EOF_

$ restic init
$ restic backup .bashrc
$ restic snapshots
ID        Date                 Host        Tags        Directory
----------------------------------------------------------------------
8d6a4777  2017-10-03 04:54:39  localhost               /data/data/com.termux/files/home/.bashrc

$ restic restore 8d6a4777 -t xxx
$ ls -al xxx
total 12
drwx------    2 u0_a120  u0_a120       4096 Oct  3 12:59 .
drwx------   14 u0_a120  u0_a120       4096 Oct  3 12:59 ..
-rw-------    1 u0_a120  u0_a120        406 Oct  3 12:53 .bashrc
$ rm -r xxx
```

[1]: https://minio.io/
[2]: https://dl.minio.io/client/mc/release/linux-amd64/mc
[3]: https://dl.minio.io/client/mc/release/linux-386/mc
[4]: https://dl.minio.io/client/mc/release/linux-arm/mc
[5]: https://docs.minio.io/docs/minio-client-quickstart-guide
