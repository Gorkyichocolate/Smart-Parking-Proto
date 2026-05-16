package common

type User struct {
	Id       string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Email    string `protobuf:"bytes,2,opt,name=email,proto3" json:"email,omitempty"`
	FullName string `protobuf:"bytes,3,opt,name=full_name,json=fullName,proto3" json:"full_name,omitempty"`
	Role     string `protobuf:"bytes,4,opt,name=role,proto3" json:"role,omitempty"`
}

type Empty struct{}

type StatusResponse struct {
	Success bool   `protobuf:"varint,1,opt,name=success,proto3" json:"success,omitempty"`
	Message string `protobuf:"bytes,2,opt,name=message,proto3" json:"message,omitempty"`
}

type PaginationRequest struct {
	Page     int32 `protobuf:"varint,1,opt,name=page,proto3" json:"page,omitempty"`
	PageSize int32 `protobuf:"varint,2,opt,name=page_size,json=pageSize,proto3" json:"page_size,omitempty"`
}

type PaginationResponse struct {
	Total    int32 `protobuf:"varint,1,opt,name=total,proto3" json:"total,omitempty"`
	Page     int32 `protobuf:"varint,2,opt,name=page,proto3" json:"page,omitempty"`
	PageSize int32 `protobuf:"varint,3,opt,name=page_size,json=pageSize,proto3" json:"page_size,omitempty"`
}

func (m *User) Reset()         { *m = User{} }
func (m *User) String() string { return "User" }
func (m *User) ProtoMessage()  {}

func (m *Empty) Reset()         { *m = Empty{} }
func (m *Empty) String() string { return "Empty" }
func (m *Empty) ProtoMessage()  {}

func (m *StatusResponse) Reset()         { *m = StatusResponse{} }
func (m *StatusResponse) String() string { return "StatusResponse" }
func (m *StatusResponse) ProtoMessage()  {}

func (m *PaginationRequest) Reset()         { *m = PaginationRequest{} }
func (m *PaginationRequest) String() string { return "PaginationRequest" }
func (m *PaginationRequest) ProtoMessage()  {}

func (m *PaginationResponse) Reset()         { *m = PaginationResponse{} }
func (m *PaginationResponse) String() string { return "PaginationResponse" }
func (m *PaginationResponse) ProtoMessage()  {}
