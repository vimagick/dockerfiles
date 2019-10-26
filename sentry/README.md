sentry
======

[Sentry][1] is cross-platform application monitoring, with a focus on error reporting.

```bash
$ docker-compose up -d
$ docker-compose exec sentry sentry upgrade
Would you like to create a user account now? [Y/n]: y
Email: root@easypi.pro
Password: ******
Repeat for confirmation: ******
Should this user be a superuser? [y/N]: y
User created: root@easypi.pro
```

[1]: https://github.com/getsentry/sentry
