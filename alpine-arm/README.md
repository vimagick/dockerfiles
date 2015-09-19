alpine-arm
==========

![](https://badge.imagelayers.io/vimagick/alpine-arm:latest.svg)

# Makefile

```
#
# make alpine-arm image
#

RELEASE = edge

rootfs.tar.xz: mkimage-alpine.sh
	ARCH=armhf ./mkimage-alpine.sh -r $(RELEASE) -s

mkimage-alpine.sh:
	curl -sSLO https://github.com/docker/docker/raw/master/contrib/mkimage-alpine.sh
	sed -i -r -e 's/-Oxz/& APKINDEX/' \
	          -e '/docker import/s@alpine:\$$REL@vimagick/alpine-arm:$${REL#v}@' \
	          -e '/docker (tag|run)/d' mkimage-alpine.sh
	chmod +x mkimage-alpine.sh

push:
	docker push vimagick/alpine-arm:$(RELEASE:v%=%)

clean:
	rm -f mkimage-alpine.sh rootfs.tar.xz
```

## Make Images

```
$ make RELEASE=edge
$ make clean
$ make RELEASE=v3.2
$ docker tag vimagick/alpine-arm:3.2 vimagick/alpine-arm:latest
$ docker run --rm vimagick/alpine-arm:edge uname -a
$ docker run --rm vimagick/alpine-arm:3.2 uname -a
$ make push RELEASE=edge
$ make push RELEASE=v3.2
$ make push RELEASE=latest
```
