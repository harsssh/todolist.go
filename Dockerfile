FROM golang:1.17

ENV GOPATH=/go/src
ENV GOBIN=/go/bin
ENV WORKSPACE=${GOPATH}/app
RUN mkdir -p ${WORKSPACE}

WORKDIR ${WORKSPACE}

ADD . ${WORKSPACE}

RUN go mod download
RUN go mod tidy -compat=1.17

RUN go install github.com/cosmtrek/air@latest

CMD ["air"]
