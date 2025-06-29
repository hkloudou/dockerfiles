FROM alpine:3.19

RUN apk update && apk add --no-cache \
    ca-certificates \
    bash \
    wget \
    openssl \
    tzdata

RUN update-ca-certificates

WORKDIR /app/
CMD ["/bin/sh"]
