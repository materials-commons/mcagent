.PHONY: bin test all fmt deploy docs server cli setup

all: fmt bin

fmt:
	-go fmt ./...

bin: cli

cli:
	(cd ./cmd/mcagent; go build)

run: server
	(cd ./cmd/mcserv; mcserv)

devrun:
	-reflex -r '\.go$\' -s make run

devtest:
	-reflex -r '\.go$\' -s make test 

dep:
	dep ensure

test: 
	-go test -v ./...

docs:
	./makedocs.sh

setup:
	-go get -u github.com/cespare/reflex
	-dep ensure
