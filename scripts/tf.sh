#!/bin/bash
set -e
cd $HOME/hlserver

if find source2013dedi/tf2vintage/cfg -mindepth 1 | read; then
    echo "config exists"
else
    echo "config does not exist, copying base."
    cp -rv source2013dedi/tf2vintage/cfg_base/* source2013dedi/tf2vintage/cfg
fi

source2013dedi/srcds_run -game tf2vintage -steam_dir ~/hlserver -steamcmd_script ~/hlserver/tf2v_ds.txt $@
