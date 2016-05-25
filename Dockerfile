FROM golang:1.6.2-alpine

RUN apk add -U bash git su-exec
WORKDIR /go/src/github.com/iosphere/git-webhook-proxy
ADD . /go/src/github.com/iosphere/git-webhook-proxy
RUN go install

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

EXPOSE 8080