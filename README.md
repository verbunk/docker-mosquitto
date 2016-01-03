docker-mosquitto
================

Docker image for mosquitto. I'm tailoring this to work on a QNAP NAS under container station but it should be generic enough. It uses alpine linux to be as small as possible.

## Setup for Data Persistence

Create three directories on your host:

* /share/docker/mqtt/config
* /share/docker/mqtt/data
* /share/docker/mqtt/log

Copy the files from the config directory of this project into /share/docker/mqtt/config. Change the base paths for your particular needs.

## Run

    docker run -ti -p 1883:1883 -p 9001:9001 toke/mosquitto

Exposes Port 1883 (MQTT) 9001 (Websocket MQTT)

Alternatively you can use volumes to make the changes
persistent and change the configuration.

    mkdir -p /share/docker/mqtt/config/
    mkdir -p /share/docker/mqtt/data/
    mkdir -p /share/docker/mqtt/log/
    # place your mosquitto.conf in /share/docker/mqtt/config/
    # NOTE: You have to change the permissions of the directories
    # to allow the user to read/write to data and log and read from
    # config directory
    # For TESTING purposes you can use chmod -R 777 /srv/mqtt/*
    # Better use "-u" with a valid user id on your docker host

    docker run -ti -p 1883:1883 -p 9001:9001 \
    -v /srv/mqtt/config:/mqtt/config:ro \
    -v /srv/mqtt/log:/mqtt/log \
    -v /srv/mqtt/data/:/mqtt/data/ \
    --name mqtt verbunk/docker-mosquitto

Volumes: /mqtt/config, /mqtt/data and /mqtt/log

## Build

    git clone https://github.com/toke/docker-mosquitto.git
    cd docker-mosquitto
    docker build .
