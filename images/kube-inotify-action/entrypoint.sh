#!/bin/sh
[ -n "${RUNTIME_FLAGS}" ] && set "${RUNTIME_FLAGS}"
[ "${DEBUG}" = "true" ] && set -x +e

[ "${WAIT_TIME}" != "0" ] && sleep "${WAIT_TIME}"
[ "${RUN_BEFORE_LOOP}" = "true" ] && sh -c "${ACTION}"
while true; do
    inotifywait "${INOTIFY_ARGS}" "${INOTIFY_TARGET}" || true
    sh -c "${ACTION}"
done
