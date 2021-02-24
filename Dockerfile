FROM golang:alpine
# COPY codeengine.go /
RUN go build ./codeengine.go

# Copy the exe into a smaller base image
FROM alpine
COPY --from=0 /codeengine /codeengine
CMD /codeengine
