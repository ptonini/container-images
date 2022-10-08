#!/usr/bin/env sh

CMD=${@}

run_command () {
    killall $(echo ${CMD} | awk '{print $1}') 2> /dev/null
    [[ -e ${VAULT_ENV_FILE} ]] && . ${VAULT_ENV_FILE}
    ${CMD}
}


if [[ -z ${VAULT_ENV_FILE} ]]; then
    echo "ENV_FILE not defined"
    run_command
else
    echo "ENV_FILE is defined: ${VAULT_ENV_FILE}"
    until [[ -e ${VAULT_ENV_FILE} ]]; do
        echo "waiting for ${VAULT_ENV_FILE}"
        sleep 1
    done
    run_command &
    while true; do
        inotifywait -qq -e modify ${VAULT_ENV_FILE}
        run_command &
    done
fi