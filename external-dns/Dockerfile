FROM k8s.gcr.io/external-dns/external-dns:v0.11.0

MAINTAINER Pedro Tonini <pedro.tonini@nodis.com.br>
# x-release-please-start-version
ENV VERSION="0.0.0"
# x-release-please-end

USER root
RUN apk add inotify-tools
COPY entrypoint.sh /

USER 65534
ENTRYPOINT ["/entrypoint.sh"]