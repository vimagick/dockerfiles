wireguard
=========

[WireGuard®][1] is an extremely simple yet fast and modern VPN that utilizes
state-of-the-art cryptography. It aims to be faster, simpler, leaner, and more
useful than IPsec, while avoiding the massive headache. It intends to be
considerably more performant than OpenVPN.


## Up and Running

```bash
$ sudo add-apt-repository ppa:wireguard/wireguard
$ sudo apt install wireguard
$ docker-compose up -d
$ docker-compose logs -f wireguard
$ tree -d
└── data
    ├── coredns
    ├── peer_kev
    ├── peer_tom
    ├── peer_zoe
    ├── server
    └── templates
```

> [!Note]
> During container start, it will first check if the wireguard module is already [installed][2] and loaded.

## GUI Clients

- Android: https://f-droid.org/en/packages/com.wireguard.android/
- iOS: https://itunes.apple.com/us/app/wireguard/id1441195209
- MacOS: https://itunes.apple.com/us/app/wireguard/id1451685025
- Windows: https://download.wireguard.com/windows-client/

[1]: https://www.wireguard.com/
[2]: https://help.clouding.io/hc/en-us/articles/360013528839-How-to-install-WireGuard-VPN-on-Ubuntu