FROM node:16.3.0-alpine

ENV TZ=America/Los_Angeles

RUN set -ex && \
    apk add --no-cache \
    bluez \
    unzip \
    wget \
    usbutils \
    python3 \
    tzdata \
    bash \
    openrc

RUN npm config set cache /data/.npm --global

RUN wget https://github.com/baronbrew/aioblescan/archive/master.zip

RUN unzip master.zip

WORKDIR /aioblescan-master/

RUN python3 setup.py install

WORKDIR /

RUN npm install node-red node-red-dashboard -g

ENV NODE_RED_VERSION=$NODE_RED_VERSION \
    NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules \
    PATH=/usr/src/node-red/node_modules/.bin:${PATH}


COPY flows.json /flows.json

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]