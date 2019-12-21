prosody
=======

[Prosody][1] is a modern XMPP communication server. It aims to be easy to set
up and configure, and efficient with system resources.

## up and running

```bash
$ docker-compose run --rm --user=root --entrypoint=chown prosody -R prosody /var/{lib,log}/prosody
$ docker-compose up -d
$ docker-compose exec prosody prosodyctl cert generate localhost
$ mv data/var/localhost.* data/etc/certs/
$ docker-compose restart
$ docker-compose exec prosody bash
>>> prosodyctl about
>>> prosodyctl check
>>> prosodyctl status
>>> prosodyctl adduser admin@localhost
Enter new password: ******
Retype new password: ******
>>> prosodyctl register guest localhost ******
>>> prosodyctl reload
```

[1]: https://prosody.im/
