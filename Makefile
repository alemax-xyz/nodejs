.EXPORT_ALL_VARIABLES:

override VERSIONS = 16 18 20 21 22 23 24
override TARGETS := $(strip $(foreach v,$(VERSIONS),$(v) $(v)-git))

TAG ?= clover/nodejs
PLATFORMS ?= linux/amd64,linux/arm64/v8

all: ${TARGETS} latest latest-git README.md

.PHONY: all ${TARGETS} latest latest-git

README.md: README.sh
	$(SHELL) "$<" > $@

${TARGETS}:
	docker buildx build --platform "${PLATFORMS}" -t "${TAG}:$@" "$@" --push

latest latest-git:
	docker buildx build --platform "${PLATFORMS}" -t "${TAG}:$@" "$^" --push

latest: 24

latest-git: 24-git
