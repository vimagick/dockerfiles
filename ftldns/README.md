FTLDNS
==========

[FTLDNS][1] (pihole-FTL) provides an interactive API and also generates statistics for Pi-hole®'s Web interface.

## Up and Running

```bash
$ docker compose up -d

$ dig @127.0.0.1 -p 53 www.youtube.com

$ docker compose exec ftldns bash
>>> pihole-FTL sql -h gravity.db
    .schema domainlist
    insert into domainlist(type, domain) values (3, '(\.|^)youtube\.com$');
    .quit
>>> pihole-FTL regex-test www.youtube.com
    Checking domain against blacklist...
    (\.|^)youtube\.com$ matches (regex blacklist, DB ID 1)
    Time: 0.019 msec
>>> pihole -b --regex '(\.|^)baidu\.com$'
>>> pihole-FTL regex-test www.baidu.com
>>> exit

$ docker compose kill -s RTMIN ftldns

$ dig @127.0.0.1 -p 53 www.youtube.com

$ telnet 127.0.0.1 4711
>version
>stats
>top-domains (15)
>top-clients
>getallqueries-client 2.3.4.5
>quit
```

> Read more about [domainlist][2] and [telnet-api][3].

[1]: https://github.com/pi-hole/FTL
[2]: https://docs.pi-hole.net/database/gravity/#domain-tables-domainlist
[3]: https://docs.pi-hole.net/ftldns/telnet-api/
