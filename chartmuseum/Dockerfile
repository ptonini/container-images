FROM docker.io/debian:buster-slim
MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="0.0.0"
# x-release-please-end

ARG CHARTMUSEUM_VERSION=0.14.0
ARG SUDO_FORCE_REMOVE=yes

RUN apt-get update && \
    apt-get -y install curl procps inotify-tools && \
    \
    useradd -Ums /bin/sh chartmuseum && \
    curl https://raw.githubusercontent.com/helm/chartmuseum/main/scripts/get-chartmuseum | bash --version ${CHARTMUSEUM_VERSION} --no-sudo && \
    mkdir -p /vault/secrets && \
    chown chartmuseum /vault/secrets && \
    apt-get -y purge sudo

USER chartmuseum
ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/chartmuseum"]