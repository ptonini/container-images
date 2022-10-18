FROM docker.io/alpine:3.16

MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="1.0.1"
# x-release-please-end

ENV RUNTIME_FLAGS="-e"
ENV INOTIFY_ARGS="-eMODIFY"

RUN apk update && \
    apk upgrade && \
    apk add postgresql-client inotify-tools && \
    adduser -H -D -s /bin/sh updater

COPY entrypoint.sh /

USER updater

ENTRYPOINT ["/entrypoint.sh"]