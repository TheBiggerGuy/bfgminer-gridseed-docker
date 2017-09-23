# bfgminer-gridseed-docker
BFGMiner with Gridseed enabled in a Docker container for ARM

# Run
```bash
docker run --restart=unless-stopped -d --group dialout --device=/dev/ttyACM0 -v /dev/bus/usb:/dev/bus/usb -v ~/.bfgminer/bfgminer.conf:/root/.bfgminer/bfgminer.conf:ro thebiggerguy/bfgminer-gridseed-docker
```
