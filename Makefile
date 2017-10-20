# Config
DOCKER_IMAGE ?= thebiggerguy/bfgminer-gridseed-docker
# amd64 or armhf
ARCH ?= amd64

# Auto config
GIT_COMMIT = $(strip $(shell git rev-parse --short HEAD))

# Make config
.PHONY: container build-$(ARCH) release-$(ARCH)

# Targets
build: build-$(ARCH)

Dockerfile.$(ARCH): Dockerfile
	cat Dockerfile | sed -e 's/amd64/$(ARCH)/g' > Dockerfile.$(ARCH)

build-$(ARCH): Dockerfile.$(ARCH)
	docker build -t $(DOCKER_IMAGE):latest-$(ARCH) \
	             --build-arg VCS_REF=$(GIT_COMMIT) \
	             --file Dockerfile.$(ARCH) .

release-$(ARCH): build-$(ARCH)
	docker push $(DOCKER_IMAGE):latest-$(ARCH)
