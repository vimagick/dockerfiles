#
# make alpine-arm image
#

RELEASE = edge
IMAGE = vimagick/alpine-arm

rootfs.tar.xz: mkimage-alpine.sh
	ARCH=armhf ./mkimage-alpine.sh -r $(RELEASE) -s

mkimage-alpine.sh:
	curl -sSLO https://github.com/docker/docker/raw/master/contrib/mkimage-alpine.sh
	sed -i -r -e '/trap /s@@chmod 0755 $$TMP $$ROOTFS; &@' \
	          -e '/docker import/s@alpine:\$$REL@vimagick/alpine-arm:$${REL#v}@' \
	          -e '/docker (tag|run)/d' mkimage-alpine.sh
	chmod +x mkimage-alpine.sh

latest:
	docker tag $(IMAGE):$(RELEASE:v%=%) vimagick/alpine-arm:latest

push:
	docker push $(IMAGE):$(RELEASE:v%=%)

test:
	docker run --rm $(IMAGE):$(RELEASE:v%=%) uname -a

clean:
	rm -f mkimage-alpine.sh rootfs.tar.xz
