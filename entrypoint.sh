#!/bin/bash

rc-service dbus start
rc-service bluetooth start


if [ ! -f /data/flows.json ]
then
    mv /flows.json /data/flows.json    
fi

node-red --userDir /data