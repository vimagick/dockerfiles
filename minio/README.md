minio
=====

[Minio][1] offers high-performance, S3 compatible object storage.
Native to Kubernetes, MinIO is the only object storage suite available on
every public cloud, every Kubernetes distribution, the private cloud and the
edge. MinIO is software-defined and is 100% open source under GNU AGPL v3.

## Server

```bash
$ docker-compose up -d
$ curl http://127.0.0.1:9000
```

## Client

Download minio client:

- [linux/amd64][2]
- [linux/arm][3]
- [windows/arm64][4]

Read minio [tutorial][5].

```bash
$ mc alias set minio http://127.0.0.1:9000 XXXXXXXXXXXXXXXXXXXX YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
$ cat ~/.mc/config.json
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
$ mc alias set minio http://127.0.0.1:9000 XXXXXXXXXXXXXXXXXXXX YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
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

## Server

[read more][6]

[1]: https://minio.io/
[2]: https://dl.minio.io/client/mc/release/linux-amd64/mc
[3]: https://dl.minio.io/client/mc/release/linux-arm/mc
[4]: https://dl.minio.io/client/mc/release/windows-amd64/mc
[5]: https://docs.min.io/docs/minio-client-complete-guide
[6]: https://min.io/docs/minio/linux/reference/minio-server/minio-server.html
