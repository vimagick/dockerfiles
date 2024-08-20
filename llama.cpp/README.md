llama.cpp
=========

[llama.cpp][1] is to enable LLM inference with minimal setup and
state-of-the-art performance on a wide variety of hardware - locally and in the
cloud.

```bash
$ mkdir -p data

$ wget -P data https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q2_K.gguf

$ docker compose up -d

$ curl --request POST \
    --url http://localhost:8080/completion \
    --header "Content-Type: application/json" \
    --data '{"prompt": "Building a website can be done in 10 simple steps:","n_predict": 128}'
```

[1]: https://github.com/ggerganov/llama.cpp
