FROM ghcr.io/ptonini/kube-bot:1.2.1

MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="1.0.1"
# x-release-please-end

ENV DEBUG="false"
ENV WAIT_TIME="0"
ENV RUNTIME_FLAGS="-e"
ENV INOTIFY_ARGS="-eMODIFY"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]