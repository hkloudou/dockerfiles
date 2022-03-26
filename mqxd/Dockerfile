FROM --platform=$BUILDPLATFORM golang:1.18.0-alpine3.15 AS builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG VERSION
ARG CGO_ENABLED=off

ENV GOOS=$TARGETOS \
    GOARCH=$TARGETARCH
# https://github.com/hkloudou/mqx/archive/refs/heads/main.zip
RUN mkdir -p /root/mqxd && cd /root/mqxd && \
    curl -sSL https://github.com/hkloudou/mqx/archive/refs/heads/main.zip | \
    tar xz --strip 1
RUN cd /root/mqxd/app/mqxd && ../../scripts/gobuild.sh mqxd /mqxd

FROM alpine:3.15

COPY --from=builder /mqxd /usr/bin/

CMD ["/usr/bin/mqxd"]