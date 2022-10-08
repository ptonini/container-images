FROM docker.io/debian:buster-slim

MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="1.0.0"
# x-release-please-end

ENV RUNTIME_FLAGS="-e"
ENV INOTIFY_ARGS="-eMODIFY"

ARG DEBIAN_RELEASE=buster
ARG POSTGRES_VERSION=11

RUN apt-get update && \
    apt-get install -y -q sudo wget curl gnupg ca-certificates apt-transport-https inotify-tools git jq  && \
    wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb https://apt.postgresql.org/pub/repos/apt/ ${DEBIAN_RELEASE}-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && apt-get -y -q install postgresql-client-${POSTGRES_VERSION} && \
    useradd -Ums /bin/sh botman

COPY entrypoint.sh /

USER botman

ENTRYPOINT ["/entrypoint.sh"]