#!/bin/sh
set -o nounset
/usr/bin/nc -l "${BIND_ADDRESS}" "${PORT}"
