rest-server
===========

[Rest Server][1] is a high performance HTTP server that implements [restic][2]'s REST backend API.

## server

```bash
$ docker-compose up -d

$ docker-compose exec rest-server create_user user
New password: pass
Re-type new password: pass
Adding password for user user

$ tree -a data
data
└── .htpasswd
```

## client

```bash
$ export RESTIC_REPOSITORY=rest:http://user:pass@localhost:8000/test/
$ export RESTIC_PASSWORD=******

$ restic init

$ restic backup /root/.bashrc

$ restic check

$ restic snapshots
ID        Time                 Host        Tags        Paths
--------------------------------------------------------------------
8f7d2fcf  2019-12-30 09:25:15  vultr                   /root/.bashrc
--------------------------------------------------------------------

$ restic dump latest /root/.bashrc

$ mkdir -p /mnt/test
$ restic mount /mnt/test
$ tree -a /mnt/test/snapshots/
├── 2019-12-30T09:25:15Z
│   └── root
│       └── .bashrc
└── latest -> 2019-12-30T09:25:15Z

$ restic restore latest --target /tmp/test
$ tree -a /tmp/test/
└── root
    └── .bashrc
```

[1]: https://github.com/restic/rest-server
[2]: https://github.com/restic/restic
