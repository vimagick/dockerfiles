amass
=====

The OWASP [Amass][1] Project performs network mapping of attack surfaces and
external asset discovery using open source information gathering and active
reconnaissance techniques.

## docker-compose.yml

```yaml
amass:
  image: caffix/amass
  entrypoint: sleep
  command: infinity
  volumes:
    - ./data:/.config/amass
  restart: unless-stopped
```

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec amass sh
>>> amass enum -list
>>> amass enum -brute -w /wordlists/all.txt -d example.com
```

[1]: https://github.com/OWASP/Amass
