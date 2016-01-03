FROM gliderlabs/alpine
MAINTAINER James Verbunk <verbunk@gmail.com>

RUN apk add --no-cache mosquitto

RUN adduser -SDH mosquitto

COPY config /mqtt/config
VOLUME ["/mqtt/config", "/mqtt/data", "/mqtt/log"]


EXPOSE 1883 9001
CMD /usr/sbin/mosquitto -c /mqtt/config/mosquitto.conf
