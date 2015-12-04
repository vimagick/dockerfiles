ngrokd
======

[ngrok][1] is a reverse proxy that creates a secure tunnel from a public endpoint to
a locally running web service. ngrok captures and analyzes all traffic over the
tunnel for later inspection and replay.

**IMPORTANT**:

- Change `NGROK_BASE_DOMAIN` in `Dockerfile`
- Rebuild the image
- Run container
- Copy binaries/keys from container

[1]: https://github.com/inconshreveable/ngrok
