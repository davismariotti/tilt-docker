#!/bin/bash

set -m

service dbus start
bluetoothd &

node-red --userDir /data -p 1881 &

# wait for node-red
wait-on http://localhost:1880 && curl -X POST http://localhost:1880/flows -H "Content-Type: application/json" -H "Node-RED-Deployment-Type: nodes" --data "@/flow.json" && echo "Loaded flow"

# load flow
jobs -l
fg %2