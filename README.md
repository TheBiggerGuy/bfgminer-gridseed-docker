| amd64  | arm32v6 (armhf)      | arm32v7      |
| ------------- | ------------- |------------- |
| [![Build Status](https://travis-ci.org/TheBiggerGuy/bfgminer-gridseed-docker.svg?branch=travis)](https://travis-ci.org/TheBiggerGuy/bfgminer-gridseed-docker) | [![Build Status](https://travis-ci.org/TheBiggerGuy/bfgminer-gridseed-docker.svg?branch=travis)](https://travis-ci.org/TheBiggerGuy/bfgminer-gridseed-docker) | |
| [![](https://images.microbadger.com/badges/image/thebiggerguy/bfgminer-gridseed-docker:latest-amd64.svg)](https://microbadger.com/images/thebiggerguy/bfgminer-gridseed-docker:latest-amd64 "Get your own image badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/thebiggerguy/bfgminer-gridseed-docker:latest-armhf.svg)](https://microbadger.com/images/thebiggerguy/bfgminer-gridseed-docker:latest-armhf "Get your own image badge on microbadger.com")  | |


# bfgminer-gridseed-docker
BFGMiner with Gridseed enabled in a Docker container for ARM

# Run
```bash
docker run --restart=unless-stopped -d --group dialout --device=/dev/ttyACM0 -v /dev/bus/usb:/dev/bus/usb -v ~/.bfgminer/bfgminer.conf:/root/.bfgminer/bfgminer.conf:ro thebiggerguy/bfgminer-gridseed-docker
```
