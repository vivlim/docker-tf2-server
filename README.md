## Team Fortress 2 Vintage + Docker

A simple 

### Details:
You can create a new Dockerfile based on this image (FROM viviridian/tf2-vintage-server) and customize it with plugins, configs, CMD and ENTRYPOINT instructions.

```shell
# Run image with persistent config (or use start.sh).
# ./cfg will be created on first run.
mkdir -p cfg && chmod a+rw cfg && docker run -p 27015:27015 -p 27015:27015/udp -it -v "$(pwd)"/cfg:/home/tf2/hlserver/source2013dedi/tf2vintage/cfg:rw viviridian/tf2vintage

# Run without persistent config
docker run -p 27015:27015 -p 27015:27015/udp -it viviridian/tf2vintage

# Run image with custom options
mkdir -p cfg && chmod a+rw cfg && docker run -p 27015:27015 -p 27015:27015/udp -it viviridian/tf2vintage +sv_pure 2 +map ctf_2fort.bsp +maxplayers 32

# Build image
docker build . -t tf2vintage --build-arg TF2V_FULL_URL="https://<url>/TF2V_3.5R_Full.7z"
```
