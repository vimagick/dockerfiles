ultralytics
===========

[Ultralytics][1] creates cutting-edge, state-of-the-art (SOTA) YOLO models built on
years of foundational research in computer vision and AI.

```bash
$ docker run --rm -it --ipc=host ultralytics/ultralytics:latest-arm64 python
>>> from ultralytics import YOLO
>>> model = YOLO("yolo11n.pt")
>>> print(model.names)
{0: 'person', 1: 'bicycle', 2: 'car', 3: 'motorcycle', 4: 'airplane', 5: 'bus', 6: 'train', 7: 'truck', ...}
>>> results = model("https://ultralytics.com/images/bus.jpg")
>>> for r in results: print(r.boxes.xywh)
tensor([[400.0137, 478.8882, 792.3618, 499.0482],
        [740.4135, 636.7728, 138.7925, 483.8793],
        [143.3527, 651.8801, 191.8959, 504.6299],
        [283.7633, 634.5621, 121.4087, 451.7472],
        [ 34.4536, 714.2138,  68.8638, 316.2908]])
```

```bash
$ docker run --rm -it --ipc=host ultralytics/ultralytics:latest-arm64 bash
>>> yolo classify predict model=yolo11n-cls.pt source=https://ultralytics.com/images/bus.jpg
>>> ls /ultralytics/runs/classify
>>> yolo detect predict model=yolo11n.pt source=https://ultralytics.com/images/bus.jpg
>>> ls /ultralytics/runs/detect
>>> yolo solutions count model=yolo11n.pt classes="[2,5,7]" source=https://basicai-asset.s3.amazonaws.com/www/blogs/yolov8-object-counting/street.mp4
>>> ls /ultralytics/runs/solutions
```

[1]: https://github.com/ultralytics/ultralytics
