OpenLDAP
========

[![](https://www.openldap.org/images/headers/LDAPworm.gif)](https://www.openldap.org/)

OpenLDAP Software is an open source implementation of the Lightweight Directory Access Protocol.

## Directory Tree

```
├── data
│   ├── certs
│   │   ├── ca.crt
│   │   ├── ca.key
│   │   ├── ca.srl
│   │   ├── ldap.crt
│   │   ├── ldap.csr
│   │   └── ldap.key
│   ├── conf (auto generated)
│   │   ├── cn=config
│   │   ├── cn=config.ldif
│   │   └── docker-openldap-was-started-with-tls
│   └── data (auto generated)
│       ├── data.mdb
│       └── lock.mdb
└── docker-compose.yml
```

## Create Keys and Certificates

```bash
openssl req \
  -x509 -nodes -days 3650 -sha256 \
  -subj '/C=US/ST=Oregon/L=Portland/CN=easypi.duckdns.org' \
  -newkey rsa:2048 -keyout ca.key -out ca.crt

openssl req \
  -new -sha256 -newkey rsa:2048 -nodes \
  -subj '/CN=ldap.easypi.duckdns.org/O=EasyPi/C=US/ST=Oregon/L=Portland' \
  -keyout ldap.key -out ldap.csr

openssl x509 \
  -req -days 3650 -sha256 \
  -in ldap.csr -CA ca.crt -CAkey ca.key -CAcreateserial \
  -out ldap.crt
```

## Test the STARTTLS & SSL connections

```bash
$ docker-compose exec openldap bash
>>> ldapwhoami -H ldap://ldap.easypi.duckdns.org -x -ZZ
anonymous
>>> ldapwhoami -H ldaps://ldap.easypi.duckdns.org -x -D cn=admin,dc=ldap,dc=easypi,dc=duckdns,dc=org -w admin
dn:cn=admin,dc=ldap,dc=easypi,dc=duckdns,dc=org
>>> ldapsearch -H ldaps://ldap.easypi.duckdns.org -b dc=ldap,dc=easypi,dc=duckdns,dc=org -D cn=admin,dc=ldap,dc=easypi,dc=duckdns,dc=org -w admin
...
```

## GUI Client

- https://directory.apache.org/

## References

- https://www.digitalocean.com/community/tutorials/how-to-encrypt-openldap-connections-using-starttls

[1]: https://github.com/commandprompt/phpldapadmin/blob/master/config/config.php.example
