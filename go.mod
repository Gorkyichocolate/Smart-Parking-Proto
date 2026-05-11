// go.mod (в корне репозитория)
module github.com/GorkiyChocolate/smart-parking-proto

go 1.21

// Этот go.mod только для инструментов, не для импорта
require (
    google.golang.org/grpc/cmd/protoc-gen-go-grpc v1.3.0
    google.golang.org/protobuf/cmd/protoc-gen-go v1.33.0
)