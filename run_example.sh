#!/usr/bin/env bash
./dapperdox \
    -spec-dir=examples/specifications/ \
    -spec-filename=petstore/swagger.json \
    -spec-filename=refdata/swagger.yml \
    -spec-filename=uber/swagger.json \
    -bind-addr=0.0.0.0:3123 \
    -site-url=http://localhost:3123 \
    -log-level=trace \
    -force-specification-list=false \
    -theme=default
