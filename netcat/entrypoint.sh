#!/usr/bin/env sh
set -o nounset

/bin/nc -l "${BIND_ADDRESS}" "${PORT}"
