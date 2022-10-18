bittorrent-tracker
==================

[BitTorrent tracker][1] is a web service which responds to requests from
BitTorrent clients. The requests include metrics from clients that help the
tracker keep overall statistics about the torrent. The response includes a peer
list that helps the client participate in the torrent swarm.

```bash
$ docker-compose up -d

$ docker-compose logs
http server listening on 8000
udp server listening on 8000
ws server listening on 8000

$ curl http://127.0.0.1:8000/stats.json
{
  "torrents": 0,
  "activeTorrents": 0,
  "peersAll": 0,
  "peersSeederOnly": 0,
  "peersLeecherOnly": 0,
  "peersSeederAndLeecher": 0,
  "peersIPv4": 0,
  "peersIPv6": 0,
  "clients": {}
}
```

[1]: https://github.com/webtorrent/bittorrent-tracker
