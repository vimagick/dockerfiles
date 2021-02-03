wireguard
=========

[WireGuard®][1] is an extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography. It aims to be faster, simpler, leaner, and more useful than IPsec, while avoiding the massive headache. It intends to be considerably more performant than OpenVPN.


## Up and Running

```bash
$ echo 'deb http://deb.debian.org/debian buster-backports main contrib non-free' > /etc/apt/sources.list.d/buster-backports.list
$ apt update
$ apt install wireguard
$ docker-compose up -d
$ docker-compose logs -f wireguard
$ tree -d
└── data
    ├── coredns
    ├── peer1
    ├── peer2
    ├── peer3
    ├── server
    └── templates
```

## GUI Clients

- Android: https://f-droid.org/en/packages/com.wireguard.android/
- iOS: https://itunes.apple.com/us/app/wireguard/id1441195209
- MacOS: https://itunes.apple.com/us/app/wireguard/id1451685025
- Windows: https://download.wireguard.com/windows-client/

[1]: https://www.wireguard.com/
