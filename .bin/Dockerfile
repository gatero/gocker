FROM golang:1.9.2
MAINTAINER @gatero <me@daniel-ortega.mx>
RUN go-wrapper download github.com/golang/dep/cmd/dep && \
    go-wrapper install github.com/golang/dep/cmd/dep && \
    go-wrapper download github.com/markbates/refresh && \
    go-wrapper install github.com/markbates/refresh && \
    chown -R "$(id -u)":"$(id -g)" vendor Gopkg.*
CMD ["go-wrapper", "run"]
