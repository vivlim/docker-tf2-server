## Team Fortress 2 Vintage + Docker

> Team Fortress 2 Vintage is an open source re-creation of pre-Mannconomy TF2 focusing on gameplay and quality of life updates while retaining the early TF2 feeling.

A basic server for [Team Fortress 2 Vintage](https://www.moddb.com/mods/team-fortress-2-vintage) packaged as a convenient Docker container.

Follow [these instructions](https://www.moddb.com/mods/team-fortress-2-vintage/news/installing-tf2v1) to set up a client you can use to connect.

### Details:
You can create a new Dockerfile based on this image (FROM viviridian/tf2-vintage-server) and customize it with plugins, configs, CMD and ENTRYPOINT instructions.

```shell
# Run image with persistent config (or use start.sh).
# ./cfg will be populated on first run.
mkdir -p cfg && chmod a+rw cfg && docker run -p 27015:27015 -p 27015:27015/udp -it -v "$(pwd)"/cfg:/home/tf2/hlserver/source2013dedi/tf2vintage/cfg:rw viviridian/tf2vintage

# Run without persistent config
docker run -p 27015:27015 -p 27015:27015/udp -it viviridian/tf2vintage

# Run image with custom options
mkdir -p cfg && chmod a+rw cfg && docker run -p 27015:27015 -p 27015:27015/udp -it viviridian/tf2vintage +sv_pure 2 +map ctf_2fort.bsp +maxplayers 32

# Build image
docker build . -t tf2vintage --build-arg TF2V_FULL_URL="https://<url>/TF2V_3.5R_Full.7z"
```
