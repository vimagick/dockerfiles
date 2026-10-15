hubot
=====

[Hubot][1] is a customizable, life embetterment robot commissioned by github.
Hubot's power comes through [scripts][2].

## docker-compse.yml

- Click [here][3] to generate `HUBOT_SLACK_TOKEN`
- Click [here][4] to get `HUBOT_AUTH_ADMIN`

## up and running

```bash
$ docker compose up -d
$ docker compose exec hubot sh
>>> npm install --save hubot-auth
>>> vi external-scripts.json
>>> exit
$ vi data/hubot/demo.js
$ docker compose restart
```

<details>
<summary>demo.js</summary>

```coffee
module.exports = (robot) => {

  // Admin-only command: only users with the 'ops' role can run this
  robot.respond(/deploy (.*)/i, (res) => {
    const user = robot.brain.userForName(res.message.user.name);
    const target = res.match[1];

    if (!user) {
      res.reply("User not found.");
      return;
    }

    if (!robot.auth.hasRole(user, 'ops')) {
      res.reply("Access Denied. You need the 'ops' role.");
      return;
    }

    // Command logic here
    res.send(`Deploying to ${target}...`);
  });

  // Public command: no role check, anyone can use it
  robot.respond(/status/i, (res) => {
    res.send("All systems operational.");
  });

};
```
</details>

## chat-ops

```
kevin [5:25 PM] what roles do I have
hubot [5:25 PM] kevin has the following roles: admin.

kevin [5:24 PM] who is kevin
hubot [5:24 PM] { "id": "UXXXXXXXX", "name": "kevin" }

kevin [5:26 PM] kevin has ops role
hubot [5:26 PM] OK, kevin has the 'ops' role.

kevin [5:27 PM] deply foo
hubot [5:27 PM] Deploying to foo...

kevin [5:28 PM] kevin doesn't have ops role
hubot [5:28 PM] OK, kevin doesn't have the 'ops' role.

kevin [5:29 PM] deply foo
hubot [5:29 PM] Access Denied. You need the 'ops' role.
```

[1]: https://hubot.github.com/
[2]: https://hubot.github.com/docs/scripting/
[3]: https://my.slack.com/services/new/hubot
[4]: https://api.slack.com/methods/users.list/test
