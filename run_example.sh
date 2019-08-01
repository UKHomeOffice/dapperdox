#!/usr/bin/env bash
./dapperdox \
    -spec-dir=examples/specifications/refdata/ \
    -bind-addr=0.0.0.0:3123 \
    -site-url=http://localhost:3123 \
    -log-level=trace \
    -force-specification-list=false \
    -theme=default
