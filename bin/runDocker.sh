#!/usr/bin/env bash

docker run --rm \
    --name cto-dapperdox \
    -p3123:3123 \
    -e SPEC_FILENAME="refdata/swagger.yml,petstore/swagger.json" \
    -e WAIT=1 \
    -e LOGLEVEL=trace \
    -v $PWD/examples/specifications:/go/bin/specs \
    -d cto-dapperdox:latest
