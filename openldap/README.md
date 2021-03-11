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
version: "3.8"

services:

  openldap:
    image: osixia/openldap
    command: "--loglevel debug"
    hostname: ldap.easypi.duckdns.org
    ports:
      - "389:389"
      - "636:636"
    volumes:
      - ./data/certs:/container/service/slapd/assets/certs
      - ./data/etc:/etc/ldap/slapd.d
      - ./data/var:/var/lib/ldap
      - ./data/run:/container/run
    environment:
      - LDAP_ORGANISATION=EasyPi
      - LDAP_DOMAIN=ldap.easypi.duckdns.org
      - LDAP_ADMIN_PASSWORD=admin
      - LDAP_CONFIG_PASSWORD=config
      - LDAP_TLS=true
      - LDAP_TLS_CA_CRT_FILENAME=ca.crt
      - LDAP_TLS_CRT_FILENAME=ldap.crt
      - LDAP_TLS_KEY_FILENAME=ldap.key
      - LDAP_TLS_VERIFY_CLIENT=try
      - LDAP_TLS_ENFORCE=true
    restart: unless-stopped
  
# phpldapadmin:
#   image: osixia/phpldapadmin
#   command: "--loglevel debug"
#   ports:
#     - "8080:80"
#   environment:
#     # PHPLDAPADMIN_LDAP_HOSTS=#PYTHON2BASH:[{'ldap.easypi.duckdns.org':[{'server':[{'tls':True}]}]}]
#     - PHPLDAPADMIN_LDAP_HOSTS=ldaps://ldap.easypi.duckdns.org/
#     - PHPLDAPADMIN_HTTPS=false
#     - PHPLDAPADMIN_TRUST_PROXY_SSL=true
#   extra_hosts:
#     - ldap.easypi.duckdns.org:x.x.x.x
#   depends_on:
#     - openldap
#   restart: unless-stopped
```

> :warnning: I haven't figured out how to connect [phpldapadmin][1] to openladp via STARTTLS:
>> openldap_1      | 5d8a7abe conn=1023 fd=12 ACCEPT from IP=172.29.0.1:59342 (IP=0.0.0.0:389)
>> openldap_1      | 5d8a7abe conn=1023 op=0 EXT oid=1.3.6.1.4.1.1466.20037
>> openldap_1      | 5d8a7abe conn=1023 op=0 STARTTLS
>> openldap_1      | 5d8a7abe conn=1023 op=0 RESULT oid= err=0 text=
>> openldap_1      | 5d8a7abe conn=1023 fd=12 TLS established tls_ssf=256 ssf=256
>> openldap_1      | 5d8a7abe conn=1023 fd=12 closed (connection lost)

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
