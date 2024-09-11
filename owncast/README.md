owncast
=======

[Owncast][1] is a self-hosted live video and web chat server for use with
existing popular broadcasting software. Point your live stream at a server you
personally control and regain ownership over your content.

## Up and Running

```yaml
version: "3.8"
services:
  owncast:
    image: owncast/owncast:0.1.3
    command: /app/owncast
    ports:
      - "1935:1935"
      - "8080:8080"
    volumes:
      - ./data:/app/data
    restart: unless-stopped
```

```bash
$ mkdir -p data
# temporarily disable until we figure out how to move forward
# chown -R 101:101 data
$ docker compose up -d
```

> https://github.com/owncast/owncast/blob/develop/Earthfile#L129-L131

## Using with OBS / Streamlabs

OBS is a pretty good piece of free software that will get you streaming from your own computer right away.

- Install OBS or Streamlabs OBS and get it working with your local setup.
- Open OBS Settings and go to “Stream”.
- Select “Custom…” as the service.
- Enter the URL of the server running your streaming service in the format of rtmp://myserver.net/live.
- Enter your “Stream Key” that matches the key you put in your config.yaml file.
- Start the server.
- Press “Start Streaming” (OBS) or “Go Live” (Streamlabs) on OBS.

## Recommended Mobile Apps

- Android: https://play.google.com/store/apps/details?id=com.streamlabs&hl=en_US
- iOS: https://apps.apple.com/us/app/streamlabs-live-streaming-app/id1294578643

## 3rd-party Integrations

- https://owncast.online/thirdparty/apis/
- http://127.0.0.1:8080/admin/access-tokens/

```bash
$ API_URL=http://127.0.0.1:8080/api/integrations
$ API_TOKEN=******
$ curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $API_TOKEN" -d '{"body": "I am a system message!"}' $API_URL/chat/system
{"message":"sent","success":true}
```

[1]: https://owncast.online/
