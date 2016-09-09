traefik
=======

![](https://traefik.io/traefik.logo.svg)

[Træfɪk][1] is a modern HTTP reverse proxy and load balancer made to deploy
microservices with ease. It supports several backends (Docker 🐳, Swarm 🐳🐳,
Mesos/Marathon, Consul, Etcd, Zookeeper, BoltDB, Rest API, file...) to manage
its configuration automatically and dynamically.

## up and running

```bash
$ kubectl cluster-info
$ kubectl create -f k8s.rc.yaml -f k8s.ing.yaml
$ kubectl run website --image=easypi/nginx-arm --port=80 --replicas=4
$ kubectl expose deployment website --type=NodePort
$ curl --resolve website:80:192.168.31.231 http://website/
```

## references

- <https://medium.com/@rothgar/exposing-services-using-ingress-with-on-prem-kubernetes-clusters-f413d87b6d34>

[1]: https://github.com/containous/traefik
