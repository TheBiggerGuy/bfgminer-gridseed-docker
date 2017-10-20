.PHONY: container push

Dockerfile.arm32v6: Dockerfile
	cat Dockerfile | sed -e 's/amd64/arm32v6/g' > Dockerfile.arm32v6

Dockerfile.amd64: Dockerfile
	cat Dockerfile > Dockerfile.amd64

build-arm32v6: Dockerfile.arm32v6
	docker build -t thebiggerguy/bfgminer-gridseed-docker:latest-arm32v6 --file Dockerfile.arm32v6 .

build-amd64: Dockerfile.amd64
	docker build -t thebiggerguy/bfgminer-gridseed-docker:latest-arm32v6 --file Dockerfile.amd64 .

release-arm32v6: build-arm32v6
	docker push thebiggerguy/bfgminer-gridseed-docker:latest-arm32v6

release-arm64: build-amd64
	docker push thebiggerguy/bfgminer-gridseed-docker:latest-amd64
