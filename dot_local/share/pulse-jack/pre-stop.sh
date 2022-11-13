#!/bin/bash

SINKID=$(LANG=C pactl list | grep -B 1 "Name: module-jack-sink" | grep Module | sed 's/[^0-9]//g')
for i in $SINKID
do pactl unload-module $i
done

SOURCEID=$(LANG=C pactl list | grep -B 1 "Name: module-jack-source" | grep Module | sed 's/[^0-9]//g')
for i in $SOURCEID
do pactl unload-module $i
done

# sleep 5