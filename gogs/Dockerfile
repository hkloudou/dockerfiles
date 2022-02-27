FROM --platform=$BUILDPLATFORM golang:alpine AS builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG VERSION
ARG CGO_ENABLED=on

ENV GOOS=$TARGETOS \
    GOARCH=$TARGETARCH

RUN apk add --no-cache curl build-base git libcap && \
    mkdir -p /root/frp && cd /root/frp && \
    curl -sSL https://github.com/gogs/gogs/archive/v$VERSION.tar.gz | \
    tar xz --strip 1 && \
    make build && \
    cp ./gogs /gogs
    # go build -v -ldflags "-s -w" -o /frps ./cmd/frps && \
    # go build -v -ldflags "-s -w" -o /frpc ./cmd/frpc && \
    # ls /frp* | xargs -n1 setcap 'cap_net_bind_service+ep' && \
    # cp ./conf/frp* /etc/

FROM alpine:3.15

COPY --from=builder /gogs /usr/bin/
RUN apk update && apk add --no-cache git openssh-keygen
CMD ["/usr/bin/gogs", "web"]