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

## docker-compose.yml

```yaml
openldap:
  image: osixia/openldap
  ports:
    - "389:389"
  volumes:
    - ./data/certs:/container/service/slapd/assets/certs
    - ./data/conf:/etc/ldap/slapd.d
    - ./data/data:/var/lib/ldap
  environment:
    - LDAP_ORGANISATION=EasyPi
    - LDAP_DOMAIN=ldap.easypi.pro
    - LDAP_ADMIN_PASSWORD=admin
    - LDAP_CONFIG_PASSWORD=config
    - LDAP_TLS_CA_CRT_FILENAME=ca.crt
    - LDAP_TLS_CRT_FILENAME=ldap.crt
    - LDAP_TLS_KEY_FILENAME=ldap.key
    # LDAP_TLS_ENFORCE=true
  restart: always

phpldapadmin:
  image: osixia/phpldapadmin
  ports:
    - "8080:80"
  environment:
    - PHPLDAPADMIN_LDAP_HOSTS=openldap
    - PHPLDAPADMIN_HTTPS=false
  links:
    - openldap
  restart: always
```

> :warnning: I haven't figured out how to connect phpldapadmin to openladp via STARTTLS.

## Create Keys and Certificates

```bash
openssl req \
  -x509 -nodes -days 3650 -sha256 \
  -subj '/C=US/ST=Oregon/L=Portland/CN=easypi.pro' \
  -newkey rsa:2048 -keyout ca.key -out ca.crt

openssl req \
  -new -sha256 -newkey rsa:2048 -nodes \
  -subj '/CN=ldap.easypi.pro/O=EasyPi/C=US/ST=Oregon/L=Portland' \
  -keyout ldap.key -out ldap.csr

openssl x509 \
  -req -days 3650 -sha256 \
  -in ldap.csr -CA ca.crt -CAkey ca.key -CAcreateserial \
  -out ldap.crt
```

## Test the STARTTLS upgrade

```bash
$ docker-compose exec openldap bash
>>> ldapwhoami -H ldap://ldap.easypi.pro -x -ZZ
anonymous
>>> exit
exit
```

## References

- https://www.digitalocean.com/community/tutorials/how-to-encrypt-openldap-connections-using-starttls
