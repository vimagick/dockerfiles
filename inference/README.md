inference
=========

[Inference][1] turns any computer or edge device into a command center for your computer vision projects.

```bash
$ docker compose up -d

$ curl -X POST "http://localhost:9001/infer/workflows/roboflow-docs/model-comparison" \
       -H "Content-Type: application/json" \
       -d '{
               "api_key": "<YOUR API KEY -- REMOVE THIS LINE IF NOT FILLING>",
               "inputs": {
                   "image": {
                       "type": "url",
                       "value": "https://media.roboflow.com/workflows/examples/bleachers.jpg"
                   },
                   "model1": "yolov8n-640",
                   "model2": "yolov11n-640"
               }
           }'
```

[1]: https://github.com/roboflow/inference/tree/main
