FROM docker.io/alpine:3.16

MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="1.2.1"
# x-release-please-end

RUN apk add curl jq inotify-tools bash && \
    apk add helm kubectl --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing/ && \
    adduser --disabled-password --home /home/kube --shell /bin/sh kube

USER kube