.PHONY: container push

build:
	docker build -t thebiggerguy/bfgminer-gridseed-docker:latest .

release: build
	docker push thebiggerguy/bfgminer-gridseed-docker:latest
