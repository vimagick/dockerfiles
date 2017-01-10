hubot
=====

![](https://badge.imagelayers.io/vimagick/hubot:latest.svg)

[Hubot][1] is a customizable, life embetterment robot commissioned by github.
Hubot's power comes through [scripts][3].

## docker-compse.yml

```yaml
hubot:
  image: vimagick/hubot
  volumes:
    - ./data:/home/hubot/scripts
  environment:
    - HUBOT_SLACK_TOKEN=xoxb-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxx
  restart: always
```

> Goto [here][2] to generate `HUBOT_SLACK_TOKEN`.

[1]: https://hubot.github.com/
[2]: https://my.slack.com/services/new/hubot
[3]: https://github.com/github/hubot/blob/master/docs/scripting.md
