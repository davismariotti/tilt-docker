# Instructions for running TiltPi Docker

## Docker run

```
docker run -d \
--name=TiltPi \
--net=host \
--privileged=true \
--cap-add=NET_ADMIN \
--device=/dev/bus/usb/001/011 \
-e TZ="America/Los_Angeles" \
-e TCP_PORT_1881=1881 \
-v /mnt/user/appdata/tilt:/data \
davismariotti/tiltpi-docker:1.0
```

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
      - /mnt/user/appdata/tilt:/data
    environment:
      TZ: "America/Los_Angeles"
      TCP_PORT_1881: 1881
```