FROM alpine:3.19

RUN /bin/sh -c apk add --no-cache --virtual .run-deps ca-certificates bash wget openssl && update-ca-certificates

WORKDIR /app/

CMD ["/bin/sh"]
