ARG APP_VERSION=v0.11.0
FROM k8s.gcr.io/external-dns/external-dns:${APP_VERSION}

MAINTAINER Pedro Tonini <pedro.tonini@nodis.com.br>
# x-release-please-start-version
ENV VERSION="1.0.0"
# x-release-please-end
ENV APP_VERSION=${APP_VERSION}

USER root
RUN apk add inotify-tools
COPY entrypoint.sh /

USER 65534
ENTRYPOINT ["/entrypoint.sh"]