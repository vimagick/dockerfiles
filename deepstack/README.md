deepstack
=========

![](https://deepquest.sfo2.digitaloceanspaces.com/deepstackcc/static/img/deepstacklogo.png)

[DeepStack][1] is an Open-Source AI API engine that serves pre-built models and
custom models on multiple edge devices locally or on your private cloud.

## up and running

```bash
$ docker-compose up -d
$ http --form http://127.0.0.1:5000/v1/vision/face/ image@photo.jpg
```

[1]: https://deepstack.cc/
