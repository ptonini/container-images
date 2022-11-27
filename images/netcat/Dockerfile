FROM docker.io/alpine:3.16

MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="1.1.0"
# x-release-please-end

RUN apk add netcat-openbsd

COPY entrypoint.sh /

ENV BIND_ADDRESS="0.0.0.0"
ENV PORT="9999"

USER 65534
CMD ["/entrypoint.sh"]