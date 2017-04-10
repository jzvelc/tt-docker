#!/bin/bash

# Do some stuff like cache warmup, wait for services etc.
if [[ -n "${REDIS_ADDR}" ]]; then
    dockerize -wait tcp://redis:6379 -timeout 30s
fi

exec "$@"
