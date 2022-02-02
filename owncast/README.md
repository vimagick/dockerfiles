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
    image: gabekangas/owncast
    command: /app/owncast -backupdir=/data -database=/data/database.db
    ports:
      - "1935:1935"
      - "8080:8080"
    volumes:
      - ./data:/data
    restart: unless-stopped
```

## Using with OBS / Streamlabs

OBS is a pretty good piece of free software that will get you streaming from your own computer right away.

- Install OBS or Streamlabs OBS and get it working with your local setup.
- Open OBS Settings and go to “Stream”.
- Select “Custom…” as the service.
- Enter the URL of the server running your streaming service in the format of rtmp://myserver.net/live.
- Enter your “Stream Key” that matches the key you put in your config.yaml file.
- Start the server.
- Press “Start Streaming” (OBS) or “Go Live” (Streamlabs) on OBS.

[1]: https://owncast.online/
