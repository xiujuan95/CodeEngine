FROM golang:alpine

COPY . /go/build
WORKDIR /go/build

COPY codeengine.go /
RUN go build -o /codeengine /codeengine.go

# Copy the exe into a smaller base image
FROM alpine
COPY --from=0 /codeengine /codeengine
CMD /codeengine
