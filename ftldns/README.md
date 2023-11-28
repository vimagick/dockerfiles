FTLDNS
==========

[FTLDNS][1] (pihole-FTL) provides an interactive API and also generates statistics for Pi-hole®'s Web interface.

## Up and Running

```bash
$ docker compose up -d

$ dig @127.0.0.1 -p 53 www.youtube.com

$ docker compose exec ftldns pihole-FTL sql -h gravity.db
>>> .schema domainlist
>>> insert into domainlist(type, domain) values (3, '(\.|^)youtube\.com$');
>>> .quit

$ docker compose exec ftldns kill -RTMIN 1

$ dig @127.0.0.1 -p 53 www.youtube.com

$ telnet 127.0.0.1 4711
>version
>stats
>top-domains (15)
>top-clients
>getallqueries-client 2.3.4.5
>quit
```

> Read more about [telnet-api][2].

[1]: https://github.com/pi-hole/FTL
[2]: https://docs.pi-hole.net/ftldns/telnet-api/
