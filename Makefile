override VERSIONS = 16 18 20 21 22 23 24
override TARGETS = $(strip $(foreach v,$(VERSIONS),$(v) $(v)-git))

TAG ?= clover/nodejs
PLATFORM ?= linux/amd64,linux/arm64/v8


all: ${TARGETS} latest latest-git README.md

.PHONY: all ${TARGETS} latest latest-git

README.md: README.sh
	PLATFORMS="`docker buildx imagetools inspect clover/nodejs --raw | jq -r '.manifests[] | select(.platform.os!="unknown" and .platform.architecture!="unknown") | "\(.platform.os)/\(.platform.architecture)\(.platform.variant//"")"'`" \
	sh $^ ${VERSIONS} > $@

${TARGETS}:
	docker buildx build --platform ${PLATFORM} -t ${TAG}:$@ $@ --push

latest latest-git:
	docker buildx build --platform ${PLATFORM} -t ${TAG}:$@ $^ --push

latest: 24

latest-git: 24-git
