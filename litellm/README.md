litellm
=======

OpenAI Proxy Server (LLM Gateway) to call 100+ LLMs in a unified interface & track spend, set budgets per virtual key/user.

```bash
$ LITELLM_KEY=sk-xxxxxx

$ curl -H "Authorization: Bearer $LITELLM_KEY" http://127.0.0.1:4000/model/info

$ curl http://127.0.0.1:4000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $LITELLM_KEY" \
  -d '{
    "model": "claude-3.5",
    "response_format": { "type": "json_object" },
    "messages": [
      {
        "role": "system",
        "content": "You are a helpful assistant designed to output JSON."
      },
      {
        "role": "user",
        "content": "Who won the world series in 2020?"
      }
    ]
  }'
```
