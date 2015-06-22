`Bro` is a powerful system that on top of the functionality it provides out of
the box, also offers the flexibility to customize analysis pretty much
arbitrarily. We provide a range of documentation material ranging from
introductory material to get you started, to full references of Bro’s various
frameworks.

## docker-compose.yml

```
bro:
  image: vimagick/bro
  command: bro -i eth0
  volumes:
    - ./logs:/opt/bro/logs
  net: host
```

## up and running

```
$ cd ~/fig/bro/

$ docker-compose up -d

$ docker exec -it bro_bro_1 bash
>>> tail -n +1 -f http.log | bro-cut -d ts user_agent
>>> exit
```
