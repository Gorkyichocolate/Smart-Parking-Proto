#!/bin/bash
# scripts/generate-all.sh

set -e

echo "🚀 Starting protobuf generation..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Check if protoc is installed
if ! command -v protoc &> /dev/null; then
    echo -e "${RED}Error: protoc is not installed${NC}"
    exit 1
fi

# Install plugins if not present
if ! command -v protoc-gen-go &> /dev/null; then
    echo "Installing protoc-gen-go..."
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
fi

if ! command -v protoc-gen-go-grpc &> /dev/null; then
    echo "Installing protoc-gen-go-grpc..."
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
fi

# Generate Go code
echo "Generating Go code..."
mkdir -p gen/go

protoc --proto_path=proto \
    --go_out=gen/go --go_opt=paths=source_relative \
    --go-grpc_out=gen/go --go-grpc_opt=paths=source_relative \
    proto/common/*.proto \
    proto/auth/*.proto \
    proto/parking/*.proto \
    proto/payment/*.proto \
    proto/notification/*.proto

echo -e "${GREEN}✅ Go code generated successfully!${NC}"

# Create go.mod
echo "Creating go.mod..."
cd gen/go
cat > go.mod << EOF
module github.com/GorkiyChocolate/smart-parking-proto/gen/go

go 1.21

require (
    google.golang.org/grpc v1.62.0
    google.golang.org/protobuf v1.33.0
)
EOF

go mod tidy
cd ../..

echo -e "${GREEN}✅ All done! Generated code in gen/go/${NC}"