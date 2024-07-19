roapi
=====

[ROAPI][1] automatically spins up read-only APIs for static datasets without
requiring you to write a single line of code.

```bash
$ mkdir -p data
$ curl https://api.spacexdata.com/v4/launches | jq . > data/spacex_launches.json
$ docker compose up -d
```

```bash
$ psql -h 127.0.0.1 -p 5432

kev=> select id, name from spacex_launches limit 10;
            id            |         name
--------------------------+----------------------
 5eb87cd9ffd86e000604b32a | FalconSat
 5eb87cdaffd86e000604b32b | DemoSat
 5eb87cdbffd86e000604b32c | Trailblazer
 5eb87cdbffd86e000604b32d | RatSat
 5eb87cdcffd86e000604b32e | RazakSat
 5eb87cddffd86e000604b32f | Falcon 9 Test Flight
 5eb87cdeffd86e000604b330 | COTS 1
 5eb87cdfffd86e000604b331 | COTS 2
 5eb87ce0ffd86e000604b332 | CRS-1
 5eb87ce1ffd86e000604b333 | CRS-2
(10 rows)

kev=> \q
```

```bash
$ curl 127.0.0.1:8080/api/sql -d "SELECT id, name FROM spacex_launches LIMIT 10" | jq -r '.[]|[.id,.name]|@tsv'
$ curl 127.0.0.1:8080/api/kv/spacex_launch_name/600f9a8d8f798e2a4d5f979e
```

[1]: https://github.com/roapi/roapi
