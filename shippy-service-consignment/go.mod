module github.com/nikitych1w/shippy/shippy-service-consignment

go 1.14

replace github.com/coreos/go-systemd => github.com/coreos/go-systemd/v22 v22.0.0
replace google.golang.org/grpc => google.golang.org/grpc v1.26.0


require (
	github.com/golang/protobuf v1.4.2
	github.com/micro/go-micro v1.18.0
	github.com/micro/go-micro/v2 v2.8.1-0.20200603084508-7b379bf1f16e
	github.com/pkg/errors v0.9.1
	golang.org/x/net v0.0.0-20200520182314-0ba52f642ac2
	google.golang.org/grpc v1.29.1
)
