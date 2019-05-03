FROM library/ubuntu:bionic AS build

ENV LANG=C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y \
        software-properties-common \
        apt-utils
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get install -y \
        wget

RUN export DEBIAN_FRONTEND=noninteractive \
 && wget -qO - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
 && add-apt-repository -y "deb https://deb.nodesource.com/node_8.x bionic main" \
 && apt-get update

RUN mkdir -p /build /rootfs
WORKDIR /build
RUN apt-get download \
    libcurl3-gnutls \
    libgnutls30 \
    libgmp10 \
    libhogweed4 \
    libp11-kit0 \
    libffi6 \
    libtasn1-6 \
    libunistring2 \
    libgssapi-krb5-2 \
    libcom-err2 \
    libk5crypto3 \
    libkrb5-3 \
    libkrb5support0 \
    libidn2-0 \
    libldap-2.4-2 \
    libgssapi3-heimdal \
    libasn1-8-heimdal \
    libhcrypto4-heimdal \
    libheimbase1-heimdal \
    libheimntlm0-heimdal \
    libwind0-heimdal \
    libkrb5-26-heimdal \
    libhx509-5-heimdal \
    libsqlite3-0 \
    libroken18-heimdal \
    libsasl2-2 \
    libsasl2-modules-db \
    libldap-common \
    libnettle6 \
    libnghttp2-14 \
    libpsl5 \
    librtmp1 \
    libexpat1 \
    libkeyutils1 \
    git
RUN find *.deb | xargs -I % dpkg-deb -x % /rootfs

WORKDIR /rootfs

RUN rm -rf \
    etc/bash_completion.d \
    usr/share

WORKDIR /


FROM clover/nodejs:11

ENV LANG=C.UTF-8

COPY --from=build /rootfs /

CMD ["sh"]
