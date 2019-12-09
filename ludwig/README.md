ludwig
======

[Ludwig][1] is a toolbox that allows to train and test deep learning models
without the need to write code.

## up and running

```bash
$ mkdir -p data
$ vim data/model.yaml

$ wget http://boston.lti.cs.cmu.edu/classes/95-865-K/HW/HW2/epinions.zip
$ unzip epinions.zip
$ mv epinions/epinions-1.csv data/train.csv
$ mv epinions/epinions-2.csv data/predict.csv

$ tree data
├── model.yaml
├── predict.csv
└── train.csv

$ docker-compose run --rm train
$ docker-compose run --rm visualize
$ docker-compose run --rm predict
$ docker-compose up -d serve

$ curl http://127.0.0.1:8000/predict -X POST -F 'text=taking photos and recording videos'
{
  "class_predictions": "Camera",
  "class_probabilities_<UNK>": 9.438252263072044e-11,
  "class_probabilities_Auto": 0.32920214533805847,
  "class_probabilities_Camera": 0.6707978248596191,
  "class_probability": 0.6707978248596191
}

$ curl http://127.0.0.1:8000/predict -X POST -F 'text=looking to buy a new sports car'
{
  "class_predictions": "Auto",
  "class_probabilities_<UNK>": 1.900043131457165e-15,
  "class_probabilities_Auto": 0.9999126195907593,
  "class_probabilities_Camera": 8.738834003452212e-05,
  "class_probability": 0.9999126195907593
}

$ tree -L 3 data
├── model.yaml
├── predict.csv
├── train.csv
├── results
│   └── experiment_example
│       ├── description.json
│       ├── model
│       └── training_statistics.json
├── results_0
│   ├── class_predictions.csv
│   ├── class_predictions.npy
│   ├── class_probabilities.csv
│   ├── class_probabilities.npy
│   ├── class_probability.csv
│   └── class_probability.npy
└── visualize
    ├── learning_curves_class_accuracy.png
    ├── learning_curves_class_hits_at_k.png
    ├── learning_curves_class_loss.png
    ├── learning_curves_combined_accuracy.png
    └── learning_curves_combined_loss.png
```

[1]: https://uber.github.io/ludwig/
