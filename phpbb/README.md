`phpBB` is a free flat-forum bulletin board software solution
that can be used to stay in touch with a group of people
or can power your entire website.

This docker image support mysqli/postgres/sqlite3.
If you choose sqlite3, please use `/var/www/store/phpbb.db` as dbpath.
And it has no volumes, please use phpBB control panel to backup database.

```
# run container
$ docker run -d --restart always --name phpbb -p 8000:80 vimagick/phpbb

# setup website
$ firefox http://localhost:8000/install
```
