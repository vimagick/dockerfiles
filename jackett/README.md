jackett
=======

[Jackett][1] works as a proxy server: it translates queries from apps (Sonarr,
Radarr, SickRage, CouchPotato, Mylar3, Lidarr, DuckieTV, qBittorrent, Nefarious
etc.) into tracker-site-specific http queries, parses the html or json
response, and then sends results back to the requesting software.

```bash
$ mkdir -p data/{etc,var}
$ chown -R 1000:1000 data
$ docker-compose up -d
$ curl http://127.0.0.1:9117
```

[1]: https://github.com/Jackett/Jackett
