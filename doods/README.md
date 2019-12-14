doods
=====

[DOODS][1] - Dedicated Open Object Detection Service

## docker-stack.yaml

```yaml
version: "3.7"

services:

  doods:
    image: snowzach/doods:rpi
    ports:
      - "8080:8080"
    configs:
      - source: config.yaml
        target: /opt/doods/config.yaml
    deploy:
      replicas: 3
      restart_policy:
        condition: on-failure

configs:
  config.yaml:
    file: ./data/config.yaml
```

## up and running

```
$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
x1ytchflr5hx8od91d8sospdm *   pi1                 Ready               Active              Leader              19.03.5
fa4q2xzyiggqrdp899umsb0bi     pi2                 Ready               Active                                  19.03.5
qyfzcl94hxeatjj1qk03ip41n     pi3                 Ready               Active                                  19.03.5

$ docker stack deploy -c docker-stack.yml doods
Creating network doods_default
Creating config doods_config.yaml
Creating service doods_doods

$ curl http://127.0.0.1:8080/version
{"version":"v0.1.5-0-g99f5768"}

$ curl http://127.0.0.1:8080/detectors
{
  "detectors": [
    {
      "name": "default",
      "type": "tflite",
      "model": "models/coco_ssd_mobilenet_v1_1.0_quant.tflite",
      "labels": [
        "person",
        "bicycle",
        "car",
        "..."
        "toothbrush"
      ],
      "width": 300,
      "height": 300,
      "channels": 3
    }
  ]
}

$ cat data.json
{
  "detector_name": "default",
  "data": "<base64 encoded image information>",
  "detect": {
    "*": 50
  }
}

$ curl -X POST -H Content-Type:application/json http://127.0.0.1:8080/detect -d @data.json
{
  "detections": [
    {
      "top": 0.8575546,
      "left": 0.6978913,
      "bottom": 0.95283264,
      "right": 0.8112617,
      "label": "sports ball",
      "confidence": 71.09375
    },
    {
      "top": 0.01605832,
      "left": 0.24361546,
      "bottom": 0.9921962,
      "right": 0.5473911,
      "label": "person",
      "confidence": 68.75
    }
  ]
}
```

[1]: https://github.com/snowzach/doods
