FROM docker.io/debian:buster-slim

MAINTAINER Pedro Tonini <pedro.tonini@nodis.com.br>
# x-release-please-start-version
ENV VERSION="1.0.1"
# x-release-please-end

ENV RUNTIME_FLAGS="-e"
ENV INOTIFY_ARGS="-eMODIFY"

ARG SUDO_FORCE_REMOVE=yes
ARG DEBIAN_RELEASE=buster

RUN apt-get update && \
    apt-get install -y -q sudo wget curl gnupg ca-certificates apt-transport-https unzip jq \
    certbot python-certbot* python3-certbot* csvkit dnsutils less groff && \
    \
    wget -qO - https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    \
    wget -qO - https://baltocdn.com/helm/signing.asc | apt-key add - && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" > /etc/apt/sources.list.d/helm-stable-debian.list && \
    \
    apt-get update && \
    apt-get -y -q install helm kubectl && \
    \
    wget -q https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip  && \
    unzip awscli-exe-linux-x86_64.zip && \
    ./aws/install && \
    rm -rf aws* && \
    \
    apt-get -y purge sudo unzip && \
    apt-get -y autoremove && \
    \
    useradd -Ums /bin/sh botman && \
    \
    mkdir /var/log/letsencrypt && \
    mkdir /var/lib/letsencrypt && \
    chown -R botman:botman /etc/letsencrypt && \
    chown -R botman:botman /var/log/letsencrypt && \
    chown -R botman:botman /var/lib/letsencrypt

USER botman

CMD ["/bin/sh", "-c", "while true; do sleep 3600; done"]