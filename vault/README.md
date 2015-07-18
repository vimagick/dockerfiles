vault
=====

![](https://badge.imagelayers.io/vimagick/vault:latest.svg)

[`Vault`][1] is a tool for securely accessing secrets. A secret is anything
that you want to tightly control access to, such as API keys, passwords,
certificates, and more. Vault provides a unified interface to any secret, while
providing tight access control and recording a detailed audit log.

## docker-compose.yml

```
data:
  image: busybox
  volumes:
    - /var/lib/vault

vault:
  image: vimagick/vault
  ports:
    - "8200:8200"
  volumes-from:
    - data
  restart: always
```

## server

```
$ cd ~/fig/vault
$ docker-compose up -d
$ docker cp vault_vault_1:/usr/bin/vault /usr/local/bin/
```

## client

```
$ export VAULT_ADDR='http://127.0.0.1:8200'
$ vault status
$ vault init | tee vault.key
$ vault unseal
$ vault auth xxxxxx
$ vault write secret/hello value=world
$ vault read secret/hello
$ vault seal
```

- Keep `vault.key` a secret.
- Run `vault unseal` 3 times.

[1]: https://www.vaultproject.io/
