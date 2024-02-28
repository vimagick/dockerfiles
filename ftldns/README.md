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
>>> pihole --regex '(\.|^)baidu\.com$'
>>> pihole --wild 'qq.com'
>>> pihole-FTL regex-test www.baidu.com
>>> pihole --wild -d youtube.com
>>> pihole --regex -l
Displaying regex blacklist:
  1: (\.|^)baidu\.com$ (enabled, last modified Tue, 27 Feb 2024 11:17:59 +0000)
  2: (\.|^)qq\.com$ (enabled, last modified Tue, 27 Feb 2024 11:22:17 +0000)
>>> pihole -c
|¯¯¯(¯)_|¯|_  ___|¯|___        Core: API Offline
| ¯_/¯|_| ' \/ _ \ / -_)
|_| |_| |_||_\___/_\___|
 ——————————————————————————————————————————————————————————
>>> exit

$ docker compose kill -s RTMIN ftldns

$ dig @127.0.0.1 -p 53 www.baidu.com

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
