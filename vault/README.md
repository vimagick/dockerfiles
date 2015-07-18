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
  volumes_from:
    - data
  privileged: true
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
$ export VAULT_ADDR='https://127.0.0.1:8200'
$ vault status
$ vault init | tee vault.key
$ vault unseal
$ vault auth
$ vault write secret/name key=value
$ vault read secret/name
$ vault seal
```

- Split `vault.key`, keep them a secret.
- Run `vault unseal` 3 times to unseal.
- Use `key=@value` to read secret from file.

[1]: https://www.vaultproject.io/
