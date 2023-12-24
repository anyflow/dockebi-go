ARG GOLANG_VERSION=1.21.5

FROM --platform=$BUILDPLATFORM golang:${GOLANG_VERSION}

COPY . /app
WORKDIR /app
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH go build .

# CMD tail -f /dev/null
ENTRYPOINT [ "/app/dockebi-go" ]