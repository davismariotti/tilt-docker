# Instructions for running TiltPi Docker

This was built using flows from [TiltPi](https://github.com/baronbrew/TILTpi/).

## Docker run

```
docker run -d \
--name=TiltPi \
--net=host \
--privileged=true \
--cap-add=NET_ADMIN \
--device=/dev/bus/usb/001/011 \
-e TZ="America/Los_Angeles" \
-e PORT=1881 \
-v tilt-data:/data \
davismariotti/tiltpi-docker:1.0
```
`--device` is only necessary if using a Bluetooth USB dongle.


`TZ` can be set to any identifier found [here](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

`PORT` is optional, useful if another instance of Node-Red is running

## Docker compose
```
version: "2"
services:
  tiltpi:
    image: davismariotti/tiltpi-docker:1.0
    container_name: TiltPi
    privileged: true
    network_mode: host
    cap_add:
      - NET_ADMIN
    devices:
      - /dev/bus/usb/001/011
    volumes:
      - tilt-data:/data
    environment:
      TZ: "America/Los_Angeles"
      PORT: 1881 # Optional
```