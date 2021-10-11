json-server
===========

![](https://badge.imagelayers.io/vimagick/json-server:latest.svg)

Get a full fake REST API with zero coding in less than 30 seconds (seriously) with [json-server][1].

## docker-compose.yml

```yaml
version: "3.8"
services:
  json-server:
    image: vimagick/json-server
    command: -H 0.0.0.0 -p 3000 -w db.json
    init: true
    ports:
      - "3000:3000"
    volumes:
      - ./data:/data
    restart: unless-stopped
```

>> :warning: `init: true` is required. [read more][2]

## data/db.json

```json
{
  "posts": [
    { "id": 1, "title": "json-server", "author": "typicode" }
  ],
  "comments": [
    { "id": 1, "body": "some comment", "postId": 1 }
  ],
  "profile": { "name": "typicode" }
}
```

## up and running

```bash
docker-compose up -d

pip install httpie

http GET :3000/posts
http POST :3000/posts id:=2 title=hello author=world
http PUT :3000/posts/2 title=Hello author=World
http PATCH :3000/posts/2 title=HELLO
http DELETE :3000/posts/2
http GET :3000/db
```

[1]: https://github.com/typicode/json-server
[2]: https://developpaper.com/avoid-running-nodejs-as-pid-1-under-the-docker-image/
