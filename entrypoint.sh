#!/bin/bash

# Do some stuff like cache warmup, wait for services etc.
if [[ -n "${REDIS_ADDR}" ]]; then
    dockerize -wait tcp://${REDIS_ADDR} -timeout 30s
fi

dockerize -template /template.tpl:/template.conf

exec "$@"
