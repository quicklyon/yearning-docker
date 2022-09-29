FROM easysoft/debian:11 as builder

ARG VERSION=v3.1.1

ARG YEARNING_URL=https://github.com/cookieY/Yearning/releases/download/${VERSION}/Yearning-${VERSION}-linux-amd64.zip

RUN wget -cO yearning.zip $YEARNING_URL && unzip yearning.zip && mv Yearning/* /opt

RUN mv /opt/Yearning /root/Yearning

FROM easysoft/debian:11

LABEL maintainer "maintainer cookieY"

ENV OS_ARCH="amd64" \
    OS_NAME="debian-11" \
    HOME_PAGE="http://next.yearning.io"

COPY debian/prebuildfs /

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

ARG IS_CHINA="true"
ENV MIRROR=${IS_CHINA}

ARG VERSION=v3.1.1
ENV YEARNING_VERSION=${VERSION}
ENV EASYSOFT_APP_NAME="Yearning $YEARNING_VERSION"
# ENV DEBUG=true

RUN install_packages curl wget zip unzip s6 pwgen cron

# Install su-exec
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "su-exec" "0.2" --checksum 687d29fd97482f493efec73a9103da232ef093b2936a341d85969bc9b9498910

# Install render-template
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "render-template" "1.0.1-10" --checksum 5e410e55497aa79a6a0c5408b69ad4247d31098bdb0853449f96197180ed65a4

# Install mysql-client
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "mysql-client" "10.5.15-20220817" -c c4f82cb5b66724dd608f0bafaac400fc0d15528599e8b42be5afe8cedfd16488

# Install wait-for-port
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "wait-for-port" "1.01" -c 2ad97310f0ecfbfac13480cabf3691238fdb3759289380262eb95f8660ebb8d1

# Copy yearning config files
COPY debian/rootfs /

# Copy yearning source code
WORKDIR /apps/yearning

# Install yearning
COPY --from=builder /root/Yearning /apps/yearning/Yearning

EXPOSE 8000

# Persistence directory
VOLUME [ "/data"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
