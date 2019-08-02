#!/usr/bin/env bash

docker run --rm \
    --name cto-dapperdox \
    -p3123:3123 \
    -e SPEC_FILENAME="refdata/swagger.json,petstore/swagger.json" \
    -e WAIT=1 \
    -v $PWD/examples/specifications:/go/bin/specs \
    -d cto-dapperdox:latest
