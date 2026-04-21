override TARGETS = 16 16-git 18 18-git 20 20-git 21 21-git 22 22-git 23 23-git 24 24-git

TAG ?= clover/nodejs
PLATFORM ?= linux/amd64,linux/arm64/v8


all: ${TARGETS} latest latest-git

.PHONY: all ${TARGETS} latest latest-git

${TARGETS}:
	docker buildx build --platform ${PLATFORM} -t ${TAG}:$@ $@ --push

latest latest-git:
	docker buildx build --platform ${PLATFORM} -t ${TAG}:$@ $^ --push

latest: 24

latest-git: 24-git
