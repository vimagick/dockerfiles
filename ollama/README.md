ollama
======

[Ollama][1] is an open-source project that serves as a powerful and
user-friendly platform for running LLMs on your local machine.

```bash
$ docker compose up -d

$ docker compose exec ollama bash
>>> ollama pull tinyllama
pulling manifest
pulling 2af3b81862c6... 100% ▕████████████████▏ 637 MB
pulling af0ddbdaaa26... 100% ▕████████████████▏   70 B
pulling c8472cd9daed... 100% ▕████████████████▏   31 B
pulling fa956ab37b8c... 100% ▕████████████████▏   98 B
pulling 6331358be52a... 100% ▕████████████████▏  483 B
verifying sha256 digest
writing manifest
removing any unused layers
success
>>> exit

$ curl http://localhost:11434/api/show -d '{"model": "tinyllama"}'

$ curl -s http://localhost:11434/api/generate -d '{
  "model": "tinyllama",
  "prompt": "What is 1+1?",
  "stream": false
}' | jq -r .response

$ curl -s http://localhost:11434/api/chat -d '{
  "model": "tinyllama",
  "messages": [
    {
      "role": "user",
      "content": "why is the sky blue?"
    }
  ],
  "stream": false
}' | jq -r .message.content
```

Read API Doc: https://github.com/ollama/ollama/blob/main/docs/api.md

[1]: https://github.com/ollama/ollama
