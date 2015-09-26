hubot
=====

[hubot][1] is a customizable, life embetterment robot commissioned by github.

## docker-compse.yml

```
hubot:
  image: vimagick/hubot
  environment:
    - HUBOT_SLACK_TOKEN=xoxb-xxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxx
  restart: always
```

> Goto [here][2] to generate `HUBOT_SLACK_TOKEN`.

[1]: https://hubot.github.com/
[2]: https://my.slack.com/services/new/hubot
