FROM golang:1.9.2
MAINTAINER @gatero <me@daniel-ortega.mx>
WORKDIR /go/src/app
COPY ./entry-point.sh /usr/local/bin
RUN go-wrapper download github.com/golang/dep/cmd/dep && \
    go-wrapper install github.com/golang/dep/cmd/dep && \
    go-wrapper download github.com/markbates/refresh && \
    go-wrapper install github.com/markbates/refresh && \
    groupadd -r gatero && \
    useradd -r -g gatero gatero && \
    usermod -m -d /home/gatero gatero;
USER gatero
CMD ["entry-point.sh"]
