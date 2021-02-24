FROM golang:alpine

COPY test.go /
RUN go build -o /test /test.go

# Copy the exe into a smaller base image
FROM alpine
COPY --from=0 /test /test
CMD /test
