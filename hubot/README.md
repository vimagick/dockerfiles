hubot
=====

![](https://badge.imagelayers.io/vimagick/hubot:latest.svg)

[Hubot][1] is a customizable, life embetterment robot commissioned by github.
Hubot's power comes through [scripts][2].

## docker-compse.yml

```yaml
version: "3.8"
services:
  hubot:
    image: vimagick/hubot
    ports:
      - "8080:8080"
    volumes:
      - ./data:/home/hubot/scripts
    environment:
      - HUBOT_SLACK_TOKEN=xoxb-xxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxx
      - HUBOT_AUTH_ADMIN=UXXXXXXXX
    restart: unless-stopped
```

- Click [this][3] to generate `HUBOT_SLACK_TOKEN`.
- Click [this][4] to get `HUBOT_AUTH_ADMIN`.

## up and running

```bash
$ docker-compose up -d
$ docker-compose exec hubot sh
>>> npm install --save hubot-auth
>>> vi external-scripts.json
>>> exit
$ vi data/example.coffee
$ docker-compose restart
```

```coffee
module.exports = (robot) ->

  robot.respond /who is @?([\w .\-]+)\?*$/i, (res) ->
    name = res.match[1].trim()
    users = robot.brain.usersForFuzzyName(name)
    for user in users
      delete user['slack']
      user = JSON.stringify user, null, 2
      res.send "```#{user}```"

  robot.respond /shell:?\s+(.+)/i, (res) ->
    cmd = res.match[1]
    user = robot.brain.userForName(res.message.user.name)
    if robot.auth.hasRole(user, ["ops"])
      cp = require "child_process"
      cp.exec cmd, (error, stdout, stderr) ->
        res.send "```#{stdout}```" if stdout
        res.send "```#{stderr}```" if stderr
    else
      res.reply "Access Denied!"
```

## chat-ops

```
kevin [5:25 PM] what roles do I have
hubot [5:25 PM] kevin has the following roles: admin.

kevin [5:24 PM] who is kevin
hubot [5:24 PM] { "id": "UXXXXXXXX", "name": "kevin" }

kevin [5:26 PM] kevin has ops role
hubot [5:26 PM] OK, kevin has the 'ops' role.

kevin [5:27 PM] shell date
hubot [5:27 PM] Sat Jan 21 10:08:28 UTC 2017

kevin [5:28 PM] kevin doesn't have ops role
hubot [5:28 PM] OK, kevin doesn't have the 'ops' role.

kevin [5:29 PM] shell date
hubot [5:29 PM] Access Denied!
```

[1]: https://hubot.github.com/
[2]: https://hubot.github.com/docs/scripting/
[3]: https://my.slack.com/services/new/hubot
[4]: https://api.slack.com/methods/users.list/test
