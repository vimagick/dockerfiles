nudenet
=======

Neural Nets for Nudity Detection and Censoring

```bash
$ docker-compose up -d

$ jq -n --arg img "$(base64 image.jpg)" '.data["image.jpg"]=$img' > data.json

$ cat data.json
{
  "data": {
    "image.jpg": "<--base64-of-image-->"
  }
}

$ http http://localhost:8080/sync < data.json
{
  "prediction": {
    "image.jpg": {
      "safe": 0.0005970880156382918,
      "unsafe": 0.9994028806686401
    }
  },
  "success": true
}

$ http http://localhost:8081/sync < data.json
{
  "prediction": "{'image.jpg': [{'box': [130, 89, 250, 209], 'score': 0.96751046, 'label': 'FACE_F'}, {'box': [98, 511, 281, 710], 'score': 0.9542637, 'label': 'EXPOSED_BELLY'}, {'box': [75, 356, 191, 474], 'score': 0.90151, 'label': 'EXPOSED_BREAST_F'}, {'box': [201, 357, 315, 474], 'score': 0.89977014, 'label': 'EXPOSED_BREAST_F'}, {'box': [146, 770, 246, 867], 'score': 0.85078907, 'label': 'COVERED_GENITALIA_F'}, {'box': [302, 348, 343, 411], 'score': 0.73944795, 'label': 'EXPOSED_ARMPITS'}, {'box': [52, 349, 91, 410], 'score': 0.703932, 'label': 'EXPOSED_ARMPITS'}]}",
  "success": true
}
```
