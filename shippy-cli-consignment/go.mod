module github.com/nikitych1w/shippy/shippy-cli-consignment

go 1.14

// replace github.com/nikitych1w/shippy/shippy-service-vessel => ../shippy-service-vessel

replace google.golang.org/grpc => google.golang.org/grpc v1.26.0

//replace github.com/nikitych1w/shippy/shippy-service-consignment => ../shippy-service-consignment

require (
	github.com/micro/go-micro/v2 v2.8.1-0.20200603084508-7b379bf1f16e
	github.com/nikitych1w/shippy/shippy-service-consignment v0.0.0-20200907160501-42bbb6e2a9cc
)
