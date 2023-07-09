FROM node:16

ENV TZ=America/Los_Angeles

RUN apt-get update

RUN apt-get install -y bluez bluez-tools bluez-hcidump bluetooth unzip wget usbutils git python3.7 tzdata

RUN npm config set cache /data/.npm --global

RUN wget https://github.com/baronbrew/aioblescan/archive/master.zip

RUN unzip master.zip

WORKDIR /aioblescan-master/

RUN python3 setup.py install

WORKDIR /

COPY flow.json /flow.json

RUN npm install node-red wait-on node-red-dashboard -g

ENV NODE_RED_VERSION=$NODE_RED_VERSION \
    NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules \
    PATH=/usr/src/node-red/node_modules/.bin:${PATH}

COPY entrypoint.sh /entrypoint.sh

EXPOSE 1880

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]