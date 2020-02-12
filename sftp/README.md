sftp
====

![](https://raw.githubusercontent.com/atmoz/sftp/master/openssh.png)

## up and running

```bash
$ chown root:root data

$ docker-compose up -d

$ sftp -P 2222 foo@localhost
foo@localhost's password: ******
Connected to foo@localhost.
>>> version
SFTP protocol version 3
>>> ls
upload
>>> put README.md upload
Uploading README.md to /upload/README.md
>>> bye

$ tree data
data
├── bar
├── baz
├── foo
│   └── upload
│       └── README.md
└── users.conf
```

:warning: Changes to existing users are ignored.
