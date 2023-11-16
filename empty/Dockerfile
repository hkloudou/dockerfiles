FROM alpine:3.18.4

RUN apk add --no-cache --virtual .run-deps ca-certificates bash wget openssl && update-ca-certificates

WORKDIR /app/

CMD ["/bin/sh"]
