FROM clover/base AS base

RUN groupadd \
        --gid 50 \
        --system \
        www \
 && useradd \
        --home-dir /var/www \
        --no-create-home \
        --system \
        --shell /bin/false \
        --uid 50 \
        --gid 50 \
        www

FROM library/debian:stable-slim AS build

ENV LANG=C.UTF-8 \
    SANDBOX_ROOT=/

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y wget openssl ca-certificates

ADD https://github.com/alemax-xyz/misc-tools.git#main /usr/local/bin/

RUN mkdir -p /build /rootfs

WORKDIR /build

COPY build/ .

COPY --from=clover/common:latest /var/lib/packages/ var/lib/packages/

RUN apt-sandbox --install --verstamp \
        --apt-config \
            APT::Install-Recommends=false \
            APT::Get::Upgrade==false \
        --repository . \
        --keyring . \
        --installed var/lib/packages \
        --obsolete packages.obsolete \
        --required packages.required

WORKDIR /rootfs

RUN rm -rf \
    usr/include \
    usr/lib/node_modules/corepack/shims/*.cmd \
    usr/lib/node_modules/corepack/shims/*.ps1 \
    usr/lib/node_modules/corepack/shims/nodewin/*.cmd \
    usr/lib/node_modules/corepack/shims/nodewin/*.ps1 \
    usr/lib/node_modules/npm/.mailmap \
    usr/lib/node_modules/npm/.npmignore \
    usr/lib/node_modules/npm/.travis.yml \
    usr/lib/node_modules/npm/AUTHORS \
    usr/lib/node_modules/npm/Makefile \
    usr/lib/node_modules/npm/make.bat \
    usr/lib/node_modules/npm/appveyor.yml \
    usr/lib/node_modules/npm/configure \
    usr/lib/node_modules/npm/bin/*.cmd \
    usr/lib/node_modules/npm/bin/node-gyp-bin/*.cmd \
    usr/lib/node_modules/npm/html \
    usr/lib/node_modules/npm/man \
    usr/lib/node_modules/npm/docs \
    usr/lib/node_modules/npm/scripts/clean-old.sh \
    usr/lib/node_modules/npm/scripts/dep-update \
    usr/lib/node_modules/npm/scripts/dev-dep-update \
    usr/lib/node_modules/npm/scripts/pr \
    usr/lib/node_modules/npm/scripts/release.sh \
    usr/lib/node_modules/npm/scripts/relocate.sh \
    usr/share

COPY --from=base /etc/group /etc/gshadow /etc/passwd /etc/shadow etc/

WORKDIR /

FROM clover/common

ENV LANG=C.UTF-8

COPY --from=build /rootfs /
