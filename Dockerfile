FROM golang:1.6.2-alpine

WORKDIR /go/src/github.com/iosphere/git-webhook-proxy
ADD . /go/src/github.com/iosphere/git-webhook-proxy
RUN apk add -U git
RUN go install
EXPOSE 8080
ENTRYPOINT ["/go/bin/git-webhook-proxy"]