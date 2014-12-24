A simple service for rendering javascript-enabled website.

## server

    phantomjs --config=config.json server.js

## client

    http :1024 targetUrl=https://github.com/ requestType=png loadImages:=true execScripts:='{"preInjected": ["1+2+3"], "postInjected": ["Math.sqrt(2)"]}'

