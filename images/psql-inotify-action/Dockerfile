FROM ghcr.io/ptonini/psql-bot:1.1.0

MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="1.1.0"
# x-release-please-end

ENV DEBUG="false"
ENV RUN_BEFORE_LOOP="false"
ENV WAIT_TIME="0"
ENV RUNTIME_FLAGS="-e"
ENV INOTIFY_ARGS="-eMODIFY"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]