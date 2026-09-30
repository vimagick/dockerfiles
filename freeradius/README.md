FreeRADIUS
==========

[FreeRADIUS][1] includes a RADIUS server, a BSD licensed client library, a PAM
library, and an Apache module. In most cases, the word FreeRADIUS refers to the
RADIUS server.

## Server Setup

Manage NAS (Network Access Server) via sqlite3.

```bash
$ docker-compose up -d
$ docker-compose exec freeradius sqlite3 /etc/raddb/freeradius.db
>>> .mode box
>>> .tables
+------------------+
| Tables_in_radius |
+------------------+
| nas              |
| radacct          |
| radcheck         |
| radgroupcheck    |
| radgroupreply    |
| radpostauth      |
| radreply         |
| radusergroup     |
+------------------+

>>> INSERT INTO radcheck VALUES
    (NULL, 'user', 'MD5-Password', ':=', MD5('pass')),
    (NULL, 'user', 'Expiration', ':=', '1 Jan 2030');

>>> SELECT * FROM radcheck;
+----+----------+--------------+----+----------------------------------+
| id | username | attribute    | op | value                            |
+----+----------+--------------+----+----------------------------------+
|  1 | user     | MD5-Password | := | 1a1dc91c907325c69271ddf0c944bc72 |
|  2 | user     | Expiration   | := | 1 Jan 2030                       |
+----+----------+--------------+----+----------------------------------+

>>> INSERT INTO nas VALUES(NULL, '0.0.0.0/0', 'testing', NULL, NULL, 'testing321', NULL, NULL, NULL);

>>> SELECT * FROM nas;
+----+-----------+-----------+------+-------+------------+--------+-----------+-------------+
| id | nasname   | shortname | type | ports | secret     | server | community | description |
+----+-----------+-----------+------+-------+------------+--------+-----------+-------------+
|  1 | 0.0.0.0/0 | testing   | NULL |  NULL | testing321 | NULL   | NULL      | NULL        |
+----+-----------+-----------+------+-------+------------+--------+-----------+-------------+

>>> SELECT * FROM radpostauth;
+----+----------+------+---------------+---------------------+
| id | username | pass | reply         | authdate            |
+----+----------+------+---------------+---------------------+
|  1 | user     | pass | Access-Accept | 2016-07-28 06:28:28 |
|  2 | user     | pass | Access-Accept | 2016-07-28 06:30:04 |
|  3 | user     | xxxx | Access-Reject | 2016-07-28 06:30:22 |
+----+----------+------+---------------+---------------------+

>>> .exit

$ docker compose exec freeradius sh
>>> vim /etc/raddb/clients.conf
>>> radtest user pass localhost 0 testing123
>>> cd /etc/raddb/certs
>>> grep default_days *.cnf
>>> apk add --no-cache openssl make

### initial oneshot setup (dangerous)
>>> make destroycerts
>>> ./bootstrap

### allow duplicated subject (optional)
>>> sed -i '/unique_subject/s/yes/no/' index.txt.attr

### for eap module:
###   check_crl = yes
###   ca_file = ${cadir}/ca_crl.pem
>>> openssl crl -in ca.crl -inform der -out crl.pem -outform pem
>>> cat ca.pem crl.pem > ca_crl.pem

### generate client certs (edit: email+name)
>>> vim client.cnf
input_password          = whatever
output_password         = whatever
emailAddress            = kev@example.org
commonName              = kev@example.org
>>> make client.pem
>>> cat index.txt
>>> openssl pkcs12 -in client.p12 -info -noout -passin pass:whatever
>>> exit

$ docker compose cp freeradius:/etc/raddb/certs/ca.pem .
$ docker compose cp freeradius:/etc/raddb/certs/ca_crl.pem .
$ docker compose cp freeradius:/etc/raddb/certs/kev@*.p12 .
$ docker compose restart freeradius
```

> [!Note]
> The `ca.pem` and `client.p12` (password: `whatever`) is for `EAP-TLS`.  
> Module `/etc/raddb/mods-enabled/eap` is enabled by default.

> [!Important]
> You need to backup `/etc/raddb/certs` regularly and keep it secret.

## OpenWrt Setup

```yaml
# opkg list-installed | grep wpad
# opkg remove wpad-basic-mbedtls
# opkg update
# opkg install wpad-openssl
# reboot
Network > Wireless > Edit > Wireless Security:
    Encryption: WPA2-EAP
    Cipher: Force CCMP-256 (AES)
    AuthServer: x.x.x.x
    AuthSecret: testing321
    AcctServer: x.x.x.x
    AcctSecret: testing321
```

## Android Setup

```yaml
# Import CA and P12(CRT+KEY)
Settings > Additional settings > Privacy > Install from SD card

# Connect WiFi
Settings > WLAN > TLS:
    CA: xxxxxx
    KEY: xxxxxx
    ID: android
```

## Client Setup

```bash
# ssh root@192.168.31.231
$ pacman -S freeradius freeradius-client
$ radtest user pass 192.168.31.138 0 testing321
$ radtest user xxxx 192.168.31.138 0 testing321
```

[Other clients][2]

## Let's Encrypt

> [!Note]
> If you use `server.pem` signed by Let's Encrypt, `ca_file` is not required for PEAP.
> Clients can use system certificates.

[1]: http://freeradius.org/
[2]: https://help.ironwifi.com/client-configuration
