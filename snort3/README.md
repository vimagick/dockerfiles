snort3
======

[Snort 3][1] is the next step in our yearslong journey of protecting users' networks
from unwanted traffic, malicious software and spam and phishing documents.

```bash
$ mkdir -p data/{etc,log}
$ wget -P data/etc https://github.com/snort3/snort3/raw/refs/heads/master/lua/snort.lua
$ vim data/etc/snort.lua
$ docker compose up -d
$ tail -f data/log/alert_fast.txt
```

[1]: https://www.snort.org/snort3
