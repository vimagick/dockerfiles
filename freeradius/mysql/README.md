FreeRadius MySQL
================

## SQL Patch

```
$ wget https://github.com/FreeRADIUS/freeradius-server/raw/release_3_0_11/raddb/mods-config/sql/main/mysql/setup.sql
$ wget https://github.com/FreeRADIUS/freeradius-server/raw/release_3_0_11/raddb/mods-config/sql/main/mysql/schema.sql
```

File: 00-setup.sql

```diff
#
#  Create default administrator for RADIUS
#
CREATE USER [-'radius'@'localhost';-]{+'radius'@'%';+}
SET PASSWORD FOR [-'radius'@'localhost'-]{+'radius'@'%'+} = PASSWORD('radpass');

# The server can read any table in SQL
GRANT SELECT ON radius.* TO [-'radius'@'localhost';-]{+'radius'@'%';+}

# The server can write to the accounting and post-auth logging table.
#
#  i.e.
GRANT ALL on radius.radacct TO [-'radius'@'localhost';-]{+'radius'@'%';+}
GRANT ALL on radius.radpostauth TO [-'radius'@'localhost';-]{+'radius'@'%';+}
```

File: 01-schema.sql

```diff
@@ -1,5 +1,8 @@
+CREATE DATABASE radius;
+USE radius;
```

## MySQL Setup

```ini
server = "mysql"
port = 3306
login = "radius"
password = "radpass"
radius_db = "radius"
```
