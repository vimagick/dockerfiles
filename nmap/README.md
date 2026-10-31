nmap
====

[Nmap][1] ("Network Mapper") is a free and open source utility for network discovery and security auditing.

## Tutorial

```bash
# Create an alias
$ alias nmap='docker run --rm --network host easypi/nmap'

# Do port scan
$ nmap -sT -Pn -p 22,80,443,8080 127.0.0.1
```

[1]: https://nmap.org/