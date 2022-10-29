FROM ghcr.io/ptonini/psql-bot:1.1.0

MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="1.1.0"
# x-release-please-end

ENV RUNTIME_FLAGS="-e"
ENV INOTIFY_ARGS="-eMODIFY"
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]