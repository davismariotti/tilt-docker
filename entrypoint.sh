#!/bin/bash

service dbus start
bluetoothd &


if [ ! -f /data/flows.json ]
then
    mv /flows.json /data/flows.json    
fi

node-red --userDir /data