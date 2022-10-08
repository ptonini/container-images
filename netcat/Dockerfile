FROM docker.io/debian:buster-slim
MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="0.0.0"
# x-release-please-end

RUN apt-get update && \
    apt-get install -y -q netcat-openbsd net-tools iproute2 && \
    apt-get -y purge sudo && \
    useradd -Ums /bin/sh netcat
COPY entrypoint.sh /

ENV BIND_ADDRESS="0.0.0.0"
ENV PORT="9999"

USER netcat
ENTRYPOINT ["/entrypoint.sh"]