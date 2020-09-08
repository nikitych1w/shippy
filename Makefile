.PHONY: build
build:
	cd shippy-cli-consignment && go build -o cli .
	cd shippy-service-consignment && go build -o service .
	cd shippy-service-vessel && go build -o vessel .
	cd shippy-service-user && go build -o user .

.PHONY: generate
generate:
	protoc --proto_path=shippy-service-consignment/proto/consignment --go_out=shippy-service-consignment/proto/consignment \
	--micro_out=shippy-service-consignment/proto/consignment consignment.proto && \
	protoc --proto_path=shippy-service-vessel/proto/vessel --go_out=shippy-service-vessel/proto/vessel \
	--micro_out=shippy-service-vessel/proto/vessel vessel.proto && \
	protoc --proto_path=shippy-service-user/proto/user --go_out=shippy-service-user/proto/user \
	--micro_out=shippy-service-user/proto/user user.proto

.PHONY: clean
clean:
	cd build && rm *
#
#.PHONY: buildimg
#buildimg:
#	 docker build -t shippy-service-consignment ./shippy-service-consignment && \
#  	 docker build -t shippy-cli-consignment ./shippy-cli-consignment && \
#  	 docker build -t shippy-service-vessel ./shippy-service-vessel
#
#.PHONY: startsrv
#startsrv:
#	 docker run -p 50051:50051 \
#		   -e MICRO_SERVER_ADDRESS=:50051 \
#		   shippy-service-consignment
#
#.PHONY: startclient
#startclient:
#	docker run shippy-cli-consignment
#
#.PHONY: startvessel
#startvessel:
#	docker run shippy-vessel-consignment


.PHONY: run
run:
	docker-compose up


.PHONY: stop
stop:
	docker-compose down
.DEFAULT_GOAL := build

# docker build -t shippy-service-consignment ./shippy-service-consignment
# protoc --proto_path=. --go_out=. --micro_out=. proto/consignment/consignment.proto
#sudo apt-get install golang-goprotobuf-dev
#protoc --proto_path=proto/consignment1 --go_out=plugins=grpc:. consignment.proto
#docker stop $(docker ps -qa)