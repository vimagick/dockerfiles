.PHONY: webhook

export CGO_ENABLED=0
export GOPATH = /tmp/go
export GOOS = linux
export GOARCH = amd64

webhook:
	go get -d github.com/adnanh/webhook
	go build --ldflags '-s -extldflags "-static"' -i -o webhook github.com/adnanh/webhook

clean:
	rm -rf $(GOPATH)
	rm -f webhook
