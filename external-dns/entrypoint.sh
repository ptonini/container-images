#!/usr/bin/env sh
[ -n "${RUNTIME_FLAGS}" ] && set "${RUNTIME_FLAGS}"
[ "${DEBUG}" = "true" ] && set -x +e

while true; do
    killall external-dns || true
    /bin/external-dns "${@}" &
    inotifywait "${INOTIFY_ARGS}" "${TARGET}" || true
done
