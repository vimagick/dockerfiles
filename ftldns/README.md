FTLDNS
==========

[FTLDNS][1] (pihole-FTL) provides an interactive API and also generates statistics for Pi-hole®'s Web interface.

## Up and Running

```bash
$ docker compose up -d

$ dig @127.0.0.1 -p 53 www.youtube.com

$ docker compose exec ftldns pihole-FTL sql gravity.db
>>> .schema domainlist
>>> insert into domainlist(type, domain) values (3, '(\.|^)youtube\.com$');
>>> .quit

$ docker compose exec ftldns kill -RTMIN 1

$ dig @127.0.0.1 -p 53 www.youtube.com
```

[1]: https://github.com/pi-hole/FTL
