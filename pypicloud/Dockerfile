FROM docker.io/debian:buster-slim
MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="0.0.0"
# x-release-please-end
ENV PYPICLOUD_VERSION="1.3.3"

ARG SUDO_FORCE_REMOVE=yes

RUN apt-get update && \
    apt-get -y install python3-pip && \
    pip3 install uwsgi pypicloud[server]==${PYPICLOUD_VERSION} redis && \
    apt-get -y purge python3-pip sudo && \
    apt-get -y autoremove && \
    apt-get -y install python3-cryptography python3-setuptools libexpat1 libpython3.7 && \
    \
    useradd -Ums /bin/sh pypicloud && \
    mkdir -p /vault/secrets && \
    chown pypicloud /vault/secrets && \
    mkdir -p /var/lib/pypicloud && \
    chown pypicloud /var/lib/pypicloud && \
    mkdir -p /etc/pypicloud && \
ADD config.ini /etc/pypicloud/config.ini

USER pypicloud
CMD ["/usr/local/bin/uwsgi", "--die-on-term", "/etc/pypicloud/config.ini"]



