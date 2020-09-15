doods
=====

[DOODS][1] - Dedicated Open Object Detection Service

## docker-stack.yaml

```yaml
version: "3.8"

services:

  doods:
    image: snowzach/doods:arm32
    ports:
      - "8080:8080"
    configs:
      - source: config.yaml
        target: /opt/doods/config.yaml
    deploy:
      replicas: 2
      placement:
        max_replicas_per_node: 1
        constraints:
          - node.role == worker
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
oy7dhxijdatpj8v6zntsin8l0 *   pi1                 Ready               Active              Leader              19.03.12
7hkc4r7pr0mjpzxbei2y92voe     pi2                 Ready               Active                                  19.03.12
rcp67rotibho0qxfdnpqwx71l     pi3                 Ready               Active                                  19.03.12

$ docker stack deploy -c docker-stack.yml doods
Creating network doods_default
Creating config doods_config.yaml
Creating service doods_doods

$ curl http://127.0.0.1:8080/version
{"version":"v0.2.2-0-gf87b48e-dirty"}

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

$ jq -n --arg data $(base64 -w0 image.jpg) '.detector_name="default" | .detect["*"]=50 | .data=$data' > data.json

$ cat data.json
{
  "detector_name": "default",
  "data": "<base64 encoded image information>",
  "detect": {
    "*": 50
  }
}

$ base64 -w0 image.jpg | http -I http://127.0.0.1:8080/detect detector_name=default detect:='{"*":50}' data=@/dev/stdin

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
