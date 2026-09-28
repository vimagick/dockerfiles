fteproxy
========

[fteproxy][1] provides transport-layer protection to resist keyword filtering,
censorship and discriminatory routing policies.

Its job is to relay datastreams, such as web browsing traffic,
by encoding streams as messages that match a user-specified regular expression.

fteproxy is fast, free, open source, and cross platform. 
It works very well with openvpn (TCP mode).

## Internet Censorship

### The Problem

```
[Application] <--blocked--> [Firewall] <--blocked--> [Destination]
```

### The Solution

```
[Application] <-> [fteproxy client] <--FTE Encoded--> [fteproxy server] <-> [Destination]
```

## Up and Running

> [!Important]
> You need to split the docker-compose.yml into two files:
> - server: to mask a tcp service
> - client: to unmask the service

> [!Tip]
> To generate a random 64-hex-character (32-byte) key:  
>> `xxd -u -p -c32 /dev/urandom | head -n1`

```bash
$ docker compose up -d
$ docker compose ps
```

[1]: https://github.com/kpdyer/fteproxy
