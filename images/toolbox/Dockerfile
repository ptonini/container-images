FROM docker.io/debian:buster-slim
MAINTAINER Pedro Tonini <pedro.tonini@hotmail.com>
# x-release-please-start-version
ENV VERSION="1.1.0"
# x-release-please-end

ARG DEBIAN_RELEASE=buster
ARG NODEJS_VERSION=16
ARG MONGODB_VERSION=5.0
ARG POSTGRES_VERSION=11
ARG MARIADB_VERSION=10.5
ARG MYSQL_REPO_PKG=mysql-apt-config_0.8.22-1_all.deb
ARG MYSQL_VERSION=8.0
ARG CALICOCTL_VERSION=3.15.1

RUN apt-get update && \
    apt-get install -y -q sudo wget curl gnupg ca-certificates apt-transport-https && \
    \
    wget https://dev.mysql.com/get/${MYSQL_REPO_PKG} && \
    apt-get install -y ./${MYSQL_REPO_PKG} && \
    rm ${MYSQL_REPO_PKG} && \
    \
    curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION}.x | bash -  && \
    \
    wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ ${DEBIAN_RELEASE}-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    \
    wget -qO - https://www.mongodb.org/static/pgp/server-${MONGODB_VERSION}.asc | apt-key add - && \
    echo "deb http://repo.mongodb.org/apt/debian ${DEBIAN_RELEASE}/mongodb-org/${MONGODB_VERSION} main" > /etc/apt/sources.list.d/mongodb-org-${MONGO_VERSION}.list && \
    \
    wget -qO - https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    \
    wget -qO - https://baltocdn.com/helm/signing.asc | apt-key add - && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" > /etc/apt/sources.list.d/helm-stable-debian.list && \
    \
    wget -qO - https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://apt.releases.hashicorp.com ${DEBIAN_RELEASE} main" > /etc/apt/sources.list.d/hashicorp.list && \
    \
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8 && \
    echo "deb [arch=amd64] http://mariadb.mirror.liquidtelecom.com/repo/${MARIADB_VERSION}/debian $(lsb_release -cs) main" > /etc/apt/sources.list.d/mariadb.list && \
    \
    apt-get update && \
    apt-get -y -q install iputils-* procps inotify-tools traceroute nmap telnet cron dnsutils netcat redis-tools jq mariadb-client \
    certbot python-certbot* python3-certbot* nodejs vim vault helm postgresql-client-${POSTGRES_VERSION} kubectl mongodb-org-tools \
    mongodb-org-shell mongodb-mongosh google-cloud-sdk terraform git mysql-shell csvkit unzip mtr && \
    \
    wget -q https://github.com/projectcalico/calicoctl/releases/download/v${CALICOCTL_VERSION}/calicoctl && \
    chmod +x calicoctl && \
    mv calicoctl /usr/local/bin && \
    \
    wget -q https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && \
    unzip awscli-exe-linux-x86_64.zip && \
    ./aws/install && \
    rm -rf aws* && \
    \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    \
    apt-get clean && \
    apt-get autoclean && \
    \
    setcap cap_ipc_lock= /usr/bin/vault

CMD ["/bin/sh", "-c", "while true; do sleep 3600; done"]