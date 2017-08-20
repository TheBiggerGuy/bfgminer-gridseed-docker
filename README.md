# bfgminer-gridseed-docker
BFGMiner with Gridseed enabled in a Docker container for ARM

# Run
```bash
$ docker run --rm -d -v /dev/bus/usb:/dev/bus/usb -v ${PWD}/bfgminer.conf:/root/.bfgminer/bfgminer.conf:ro thebiggerguy/bfgminer-gridseed-docker
```
