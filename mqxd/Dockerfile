FROM --platform=$BUILDPLATFORM golang:1.18.0-alpine3.15 AS builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
# ARG VERSION
ARG CGO_ENABLED=off

ENV GOOS=$TARGETOS \
    GOARCH=$TARGETARCH
# https://github.com/hkloudou/mqx/archive/refs/heads/main.zip
RUN apk add --no-cache curl build-base git libcap && \
    mkdir -p /root/mqxd && cd /root/mqxd && \
    curl -sSL https://github.com/hkloudou/mqx/archive/refs/heads/main.zip | \
    tar xz --strip 1 && \
    cd app/mqxd && ../../scripts/gobuild.sh mqxd /mqxd && \
    go build -v -ldflags "-s -w" -o /frps ./cmd/frps && \
    go build -v -ldflags "-s -w" -o /frpc ./cmd/frpc && \
    ls /mqx* | xargs -n1 setcap 'cap_net_bind_service+ep' 
    # && \
    # cp ./conf/frp* /etc/
FROM alpine:3.15

COPY --from=builder /mqx* /usr/bin/

CMD ["/usr/bin/mqxd"]