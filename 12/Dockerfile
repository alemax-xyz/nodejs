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
 && add-apt-repository -y "deb https://deb.nodesource.com/node_12.x bionic main" \
 && apt-get update

RUN mkdir -p /build /rootfs
WORKDIR /build
RUN apt-get download \
    nodejs
RUN find *.deb | xargs -I % dpkg-deb -x % /rootfs

WORKDIR /rootfs

RUN rm -rf \
    usr/include \
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
    usr/lib/node_modules/npm/scripts/clean_old.sh \
    usr/lib/node_modules/npm/scripts/dep-update \
    usr/lib/node_modules/npm/scripts/dev-dep-update \
    usr/lib/node_modules/npm/scripts/pr \
    usr/lib/node_modules/npm/scripts/release.sh \
    usr/lib/node_modules/npm/scripts/relocate.sh \
    usr/share

WORKDIR /


FROM clover/common

ENV LANG=C.UTF-8

COPY --from=build /rootfs /

CMD ["sh"]
