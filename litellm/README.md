litellm
=======

[OpenAI Proxy Server][1] (LLM Gateway) to call 100+ LLMs in a unified interface & track spend, set budgets per virtual key/user.

```bash
$ LITELLM_KEY=sk-xxxxxx

$ curl -H "Authorization: Bearer $LITELLM_KEY" http://127.0.0.1:4000/v1/models

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

## To create [virtual keys][2]

```bash
$ curl --location 'http://127.0.0.1:4000/user/new' \
       --header "Authorization: Bearer $LITELLM_KEY" \
       --header 'Content-Type: application/json' \
       --data-raw '{"user_email": "username@example.com"}'
{
  "expires": "2023-12-22T09:53:13.861000Z",
  "user_id": "my-unique-id",
  "max_budget": 0.0
}

$ curl 'http://127.0.0.1:4000/key/generate' \
       --header "Authorization: Bearer $LITELLM_KEY" \
       --header 'Content-Type: application/json' \
       --data-raw '{"models": ["gpt-4o", "claude-3.5"], "user_id": "my-unique-id"}'

$ curl -H "Authorization: Bearer $LITELLM_KEY" 'http://127.0.0.1:4000/user/info?user_id=my-unique-id'
{
  "spend": 0
}
```

## Install/Upgrade litellm manually

```bash
# https://github.com/BerriAI/litellm/blob/latest/pyproject.toml
$ pipx install 'litellm[proxy]'
$ pipx upgrade litellm
$ pipx runpip litellm install -U prisma
$ source ~/.local/pipx/venvs/litellm/bin/activate
$ pip install -U prisma
$ export DATABASE_URL=postgresql://litellm:litellm@127.0.0.1:5432/litellm
$ cd ~/.local/pipx/venvs/litellm/lib/python3.13/site-packages/litellm/proxy
$ prisma db push
```

[1]: https://docs.litellm.ai/docs/simple_proxy
[2]: https://docs.litellm.ai/docs/proxy/virtual_keys
