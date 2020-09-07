.PHONY: build
build:
	cd shippy-cli-consignment && go build -o cli main.go
	cd shippy-service-consignment && go build -o service main.go

.PHONY: generate
generate:
	protoc --proto_path=shippy-service-consignment/proto/consignment --go_out=shippy-service-consignment/proto/consignment \
	--micro_out=shippy-service-consignment/proto/consignment consignment.proto

.PHONY: clean
clean:
	cd build && rm *

.PHONY: buildimg
buildimg:
	 docker build -t shippy-service-consignment ./shippy-service-consignment && docker build -t shippy-cli-consignment ./shippy-service-consignment

.PHONY: startsrv
startsrv:
	 docker run -p 50051:50051 \
		   -e MICRO_SERVER_ADDRESS=:50051 \
		   shippy-service-consignment

.PHONY: startclient
startclient:
	docker run shippy-cli-consignment

.DEFAULT_GOAL := build

# docker build -t shippy-service-consignment ./shippy-service-consignment
# protoc --proto_path=. --go_out=. --micro_out=. proto/consignment/consignment.proto
#sudo apt-get install golang-goprotobuf-dev
#protoc --proto_path=proto/consignment1 --go_out=plugins=grpc:. consignment.proto