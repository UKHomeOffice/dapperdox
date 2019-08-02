FROM golang:1.12.7 AS builder

# install unzip utility
RUN apt-get -y update && apt-get -y install zip

WORKDIR /go/src/dapperdox

COPY . ./

RUN go get ./
# build and ensure binary is fully linked
RUN CGO_ENABLED=0 go build -o /go/bin/dapperdox

FROM alpine

COPY --from=builder /go/bin/dapperdox /go/bin/dapperdox
COPY assets /go/bin/assets
COPY run.sh /go/bin

WORKDIR /go/bin

RUN mkdir -p specs
RUN chown 1000 specs

RUN mkdir -p assets/sections
RUN chown 1000 assets/sections

USER 1000
EXPOSE 3123

ENV SPEC_DIR specs
ENV ASSETS_DIR assets
ENV THEME_DIR assets
ENV THEME dapperdox-theme-gov-uk
ENV LOGLEVEL info
ENV BIND_ADDR 0.0.0.0:3123
ENV FORCE_SPECIFICATION_LIST true
ENV WAIT 10

CMD sh run.sh $WAIT

