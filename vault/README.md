vault
=====

![](https://badge.imagelayers.io/vimagick/vault:latest.svg)

[`Vault`][1] is a tool for securely accessing secrets. A secret is anything
that you want to tightly control access to, such as API keys, passwords,
certificates, and more. Vault provides a unified interface to any secret, while
providing tight access control and recording a detailed audit log.

## docker-compose.yml

```yaml
vault:
  image: vimagick/vault
  ports:
    - "8200:8200"
  volumes:
    - ./data/etc:/etc/vault
    - ./data/var:/var/lib/vault
    - ./data/log:/var/log/vault
  cap_add:
    - IPC_LOCK
  restart: always
```

> Please distribute `vault.crt` to clients.

## server

```bash
$ cd ~/fig/vault
$ mkdir data
$ openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout data/etc/vault.key -out data/etc/vault.crt
$ docker-compose up -d
$ docker cp vault_vault_1:/usr/bin/vault /usr/local/bin/
$ docker exec -it vault_vault_1 sh
>>> cd /etc/vault
>>> vault init -key-shares=5 -key-threshold=3 | tee vault.secret
>>> exit
$ docker run --rm --volumes-from vault_vault_1 -v `pwd`:/backup alpine tar cvzf /backup/vault.tgz /etc/vault /var/lib/vault /var/log/vault
```

> Split `vault.secret`, keep them a secret.

## client

```bash
$ export VAULT_ADDR='https://server:8200'
$ export VAULT_SKIP_VERIFY=0
$ cp ~/fig/vault/data/etc/vault.crt /etc/ssl/certs/vault.pem
$ update-ca-certificates
$ vault status
$ vault unseal && vault unseal && vault unseal
$ vault auth
$ vault audit-enable file file_path=/var/log/vault/audit.log
$ vault write secret/name key=value
$ vault read secret/name
$ vault seal
```

[1]: https://www.vaultproject.io/
