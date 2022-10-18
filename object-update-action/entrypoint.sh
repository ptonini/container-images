#!/bin/sh
[ -n "${RUNTIME_FLAGS}" ] && set "${RUNTIME_FLAGS}"
[ "${DEBUG}" = "true" ] && set -x +e

while true; do
    inotifywait "${INOTIFY_ARGS}" "${OBJECT}" || true
    sh -c "${ACTION}"
done
