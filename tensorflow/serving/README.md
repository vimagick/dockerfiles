tenserflow/serving
==================

[TensorFlow Serving][1] is a flexible, high-performance serving system for machine learning models, designed for production environments.

## up and running

```bash
$ mkdir -p data
$ curl -sSL https://github.com/tensorflow/serving/archive/refs/heads/master.tar.gz | tar xz -C data serving/tensorflow_serving/servables/tensorflow/testdata --strip 5
$ docker-compose up -d
$ curl -X POST http://localhost:8501/v1/models/half_plus_two:predict -d '{"instances": [1.0, 2.0, 5.0]}'
{ "predictions": [2.5, 3.0, 4.5] }
```

[1]: https://github.com/tensorflow/serving
