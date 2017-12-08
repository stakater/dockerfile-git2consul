FROM stakater/node:6.9
MAINTAINER "Stakater Team"

RUN npm install -g git2consul@0.12.13 \
     && apk -Uuv add --no-cache git openssh 'su-exec>=0.2'

RUN rm -rf /etc/service/node && mkdir -p /etc/service/git2consul
ADD start.sh /etc/service/git2consul/run


ENV COMMAND="git2consul --endpoint 127.0.0.1 --port 80 --config-file /home/git2consul/config.json"
