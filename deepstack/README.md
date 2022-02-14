deepstack
=========

![](https://deepquest.sfo2.digitaloceanspaces.com/deepstackcc/static/img/deepstacklogo.png)

[DeepStack][1] is an Open-Source AI API engine that serves pre-built models and
custom models on multiple edge devices locally or on your private cloud.

## up and running

```bash
$ mkdir -p data/{datastore,modelstore}
$ wget -P data/modelstore \
          https://github.com/odd86/deepstack_licenceplate_model/raw/main/models/licence-plate.pt \
          https://github.com/OlafenwaMoses/DeepStack_OpenLogo/releases/download/v1/openlogo.pt \
          https://github.com/OlafenwaMoses/DeepStack_ExDark/releases/download/v1/dark.pt \
          https://github.com/OlafenwaMoses/DeepStack_ActionNET/releases/download/v2/actionnetv2.pt \
          https://github.com/MikeLud/DeepStack-Security-Camera-Models/raw/main/Models/animal.pt \
          https://github.com/avatar42/RMRR.fire/raw/main/fire.pt \
          https://github.com/avatar42/RMRR.birds/raw/main/birds.pt
$ docker-compose up -d

# Face Detection
$ http --form http://127.0.0.1:5000/v1/vision/face image@photo.jpg
{"success": true, "predictions": [...]}

# Face Recognition
$ http --form http://127.0.0.1:5000/v1/vision/face/register userid=kevin image1@photo1.jpg image2@photo2.jpg
{"success": true, "message": "face added"}
$ http --form http://127.0.0.1:5000/v1/vision/face/recognize image@photo.jpg
{"success": true, "predictions": [...]}

# Object Detection
$ http --form http://127.0.0.1:5000/v1/vision/detection image@photo.jpg
{"success": true, "predictions": [...]}

# Custom Models
$ http --form http://127.0.0.1:5000/v1/vision/custom/animal image@photo.jpg
{"success": true, "predictions": [...]}
```

[1]: https://deepstack.cc/
