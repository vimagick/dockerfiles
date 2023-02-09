synapse
=======

[Synapse][1] is a Matrix homeserver implementation developed by the matrix.org core team.

```bash
$ docker-compose run --rm synapse bash
>>> cd /data
>>> /start.py generate
>>> grep 'registration_shared_secret' homeserver.yaml
>>> exit

$ docker-compose up -d

$ docker-compose exec synapse bash
>>> cd /data
>>> register_new_matrix_user http://localhost:8008 -c homeserver.yaml --help
>>> sed -i '/registration_shared_secret/s/^/#/' homeserver.yaml
>>> exit

$ docker-compose restart
```

[1]: https://matrix-org.github.io/synapse/latest/
