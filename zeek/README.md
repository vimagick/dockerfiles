zeek
====

[Zeek][1] is a passive, open-source network traffic analyzer. Many operators use
Zeek as a network security monitor (NSM) to support investigations of
suspicious or malicious activity.

- Adaptable
- Efficient
- Flexible
- Forensics
- Commercially Supported
- In-depth Analysis
- Highly Stateful
- Open Interfaces
- Open Source

## up and running

```bash
$ docker compose up -d

$ docker compose exec zeek bash
>>> cd /usr/local/zeek/logs
>>> cat dns.log | zeek-cut query | sort | uniq -c | sort -nr | head -5
    10 www.youtube.com
    3 twitter.com
    2 www.google.com
    1 www.baidu.com
    1 www.facebook.com
>>> exit
```

> Don't be evil!

[1]: https://github.com/zeek/zeek
