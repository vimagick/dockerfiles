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
