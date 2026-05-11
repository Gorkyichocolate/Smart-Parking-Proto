# Makefile
.PHONY: help install generate-go clean

help:
	@echo "Available commands:"
	@echo "  make install      - Install required tools"
	@echo "  make generate-go  - Generate Go gRPC code"
	@echo "  make clean        - Clean generated files"

install:
	@echo "Installing protoc plugins..."
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@echo "Done!"

generate-go:
	@echo "Generating Go gRPC code..."
	mkdir -p gen/go
	protoc --proto_path=proto \
		--go_out=gen/go --go_opt=paths=source_relative \
		--go-grpc_out=gen/go --go-grpc_opt=paths=source_relative \
		proto/common/*.proto \
		proto/auth/*.proto \
		proto/parking/*.proto \
		proto/payment/*.proto \
		proto/notification/*.proto
	@echo "Done! Generated code in gen/go/"

	@echo "Creating go.mod..."
	cd gen/go && go mod init github.com/GorkiyChocolate/smart-parking-proto/gen/go
	cd gen/go && go get google.golang.org/grpc
	cd gen/go && go get google.golang.org/protobuf
	@echo "Done!"

clean:
	@echo "Cleaning generated files..."
	rm -rf gen/go/
	@echo "Done!"