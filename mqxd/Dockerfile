FROM --platform=$BUILDPLATFORM golang:1.18.2-alpine3.15 AS builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG VERSION
ARG CGO_ENABLED=off

ENV GOOS=$TARGETOS \
    GOARCH=$TARGETARCH
# https://github.com/hkloudou/mqx/archive/refs/heads/main.zip
# RUN apk add --no-cache curl
# RUN mkdir -p /root/mqxd && cd /root/mqxd && \
#     curl -sSL https://github.com/hkloudou/mqx/archive/refs/heads/main.zip | \
#     tar xz --strip 1
# ADD https://github.com/hkloudou/mqx/archive/refs/heads/main.zip /root/mqxd/mqxd.zip
RUN set -ex && \
    apk add --no-cache \
        --virtual .build-deps \
        git
RUN git clone -b v${VERSION} https://github.com/hkloudou/mqx --single-branch /root/mqxd/mqx-main

# RUN cd /root/mqxd/ && unzip ./mqxd.zip -d ./
# RUN cd / && ls
# RUN file="$(ls -1 /)" && echo $file
RUN cd /root/mqxd/mqx-main/app/mqxd && ../../scripts/gobuild.sh mqxd /mqxd
# && sh ../../scripts/gobuild.sh mqxd /mqxd

FROM alpine:3.15

COPY --from=builder /mqxd /usr/bin/

CMD ["/usr/bin/mqxd"]