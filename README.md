## Team Fortress 2 Vintage + Docker

> Team Fortress 2 Vintage is an open source re-creation of pre-Mannconomy TF2 focusing on gameplay and quality of life updates while retaining the early TF2 feeling.

A basic server for [Team Fortress 2 Vintage](https://www.moddb.com/mods/team-fortress-2-vintage) packaged as a convenient Docker container.

Follow [these instructions](https://www.moddb.com/mods/team-fortress-2-vintage/news/installing-tf2v1) to set up a client you can use to connect.

If you choose to download [the image from Docker Hub](https://cloud.docker.com/u/viviridian/repository/docker/viviridian/tf2vintage) instead of building it yourself, be warned that it is **very large**, around 13GB (7GB compressed) at the time of writing this.

```shell
# Run image with persistent config (or use start.sh).
# ./cfg will be populated on first run.
mkdir -p cfg && chmod a+rw cfg && docker run -p 27015:27015 -p 27015:27015/udp -it -v "$(pwd)"/cfg:/home/tf2/hlserver/source2013dedi/tf2vintage/cfg:rw viviridian/tf2vintage

# Run without persistent config
docker run -p 27015:27015 -p 27015:27015/udp -it viviridian/tf2vintage

# Run image with custom options
mkdir -p cfg && chmod a+rw cfg && docker run -p 27015:27015 -p 27015:27015/udp -it viviridian/tf2vintage +sv_pure 2 +map ctf_2fort.bsp +maxplayers 32

# Build image.
# You will need to have a url to a TF2V mod package to extract inside the container as it is being built.
# This avoids adding the size of the mod package to the final image.
# If you have downloaded the package locally, use something like Python's SimpleHTTPServer to expose it.
docker build . -t tf2vintage --build-arg TF2V_FULL_URL="https://<url>/TF2V_3.5R_Full.7z"
```
