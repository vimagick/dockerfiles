playwright
==========

```bash
$ mkdir data
$ chown 1000:1000 data
$ docker-compose up -d
$ docker exec --user root playwright npm install -g playwright
$ alias playwright='docker exec playwright npx playwright'

$ docker exec playwright node example.js

$ playwright pdf https://github.com github.pdf
Navigating to https://github.com
Saving as pdf into github.pdf

$ playwright screenshot --full-page https://github.com github.png
Navigating to https://github.com
Capturing screenshot into github.png

$ tree data
├── example.png
├── github.pdf
└── github.png
```
