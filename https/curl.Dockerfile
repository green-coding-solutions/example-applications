FROM alpine:latest

RUN apk add curl

ENTRYPOINT ["tail", "-f", "/dev/null"]