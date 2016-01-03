FROM gliderlabs/alpine
MAINTAINER James Verbunk <verbunk@gmail.com>

RUN apk add --no-cache mosquitto

RUN adduser --system --disabled-password --disabled-login mosquitto

COPY config /mqtt/config
VOLUME ["/mqtt/config", "/mqtt/data", "/mqtt/log"]


EXPOSE 1883 9001
CMD /usr/sbin/mosquitto -c /mqtt/config/mosquitto.conf
