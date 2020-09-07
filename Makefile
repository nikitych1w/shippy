.PHONY: build
build:
	go build -o build/cli shippy-cli-consignment/main.go
	go build -o build/service shippy-service-consignment/main.go


.PHONY: generate
generate:
	protoc --proto_path=shippy-service-consignment/proto/consignment --go_out=plugins=grpc:shippy-service-consignment/proto/consignment consignment.proto

.PHONY: clean
clean:
	cd build && rm *


.DEFAULT_GOAL := build

# docker build -t shippy-service-consignment ./shippy-service-consignment