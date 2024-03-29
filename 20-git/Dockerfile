FROM library/debian:stable-slim AS build

ENV LANG=C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y \
        --no-install-recommends \
        software-properties-common \
        apt-utils

RUN mkdir -p /build /rootfs
WORKDIR /build
RUN apt-get download \
    libcurl3-gnutls \
    libgnutls30 \
    libgmp10 \
    libhogweed6 \
    libp11-kit0 \
    libffi8 \
    libtasn1-6 \
    libunistring2 \
    libgssapi-krb5-2 \
    libcom-err2 \
    libk5crypto3 \
    libkrb5-3 \
    libkrb5support0 \
    libidn2-0 \
    libldap-2.5-0 \
    libgssapi3-heimdal \
    libasn1-8-heimdal \
    libhcrypto5-heimdal \
    libheimbase1-heimdal \
    libheimntlm0-heimdal \
    libwind0-heimdal \
    libkrb5-26-heimdal \
    libhx509-5-heimdal \
    libsqlite3-0 \
    libroken19-heimdal \
    libsasl2-2 \
    libsasl2-modules-db \
    libldap-common \
    libnettle8 \
    libnghttp2-14 \
    libpsl5 \
    librtmp1 \
    libexpat1 \
    libkeyutils1 \
    libssh2-1 \
    libbrotli1 \
    libzstd1 \
    openssh-client \
    git
RUN find *.deb | xargs -I % dpkg-deb -x % /rootfs

WORKDIR /rootfs

RUN rm -rf \
    etc/bash_completion.d \
    usr/share \
    usr/lib/git-core/git \
    usr/lib/git-core/git-add--interactive \
    usr/lib/git-core/git-shell \
    usr/lib/git-core/git-upload-pack \
    usr/lib/git-core/mergetools \
 && ln -s /usr/bin/git usr/lib/git-core/git \
 && ln -s /usr/bin/git-upload-pack usr/lib/git-core/git-upload-pack \
 && ln -s /usr/bin/git-shell usr/lib/git-core/git-shell

WORKDIR /


FROM clover/nodejs:20

ENV LANG=C.UTF-8

COPY --from=build /rootfs /

CMD ["sh"]
