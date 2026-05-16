module github.com/Gorkyichocolate/smart-parking-proto/gen/go

go 1.21

require (
	github.com/Gorkyichocolate/smart-parking-proto/gen/go/auth v0.0.0
	github.com/Gorkyichocolate/smart-parking-proto/gen/go/common v0.0.0
	github.com/Gorkyichocolate/smart-parking-proto/gen/go/parking v0.0.0
	github.com/Gorkyichocolate/smart-parking-proto/gen/go/payment v0.0.0
	google.golang.org/grpc v1.62.1
	google.golang.org/protobuf v1.33.0
)

replace (
	github.com/Gorkyichocolate/smart-parking-proto/gen/go/auth => ./auth
	github.com/Gorkyichocolate/smart-parking-proto/gen/go/common => ./common
	github.com/Gorkyichocolate/smart-parking-proto/gen/go/parking => ./parking
)

replace github.com/Gorkyichocolate/smart-parking-proto/gen/go/payment => ./payment
