#!/usr/bin/env sh

[ "${DEBUG}" = "true" ] && RUNTIME_FLAGS="-x +e ${RUNTIME_FLAGS}"
[ -n "${RUNTIME_FLAGS}" ] && set "${RUNTIME_FLAGS}"

COMMAND="/bin/external-dns"

${COMMAND} "${@}" &
sleep 3
while true; do
    killall ${COMMAND}
    ${COMMAND} "${@}" &
    inotifywait "${INOTIFY_ARGS}" "${INOTIFY_TARGET}" || true
done
