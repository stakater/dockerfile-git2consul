FROM stakater/node:6.9
LABEL authors="Ali Tariq <ali.chaudhary2009@gmail.com>"

RUN npm install -g git2consul \
    && apk update && apk upgrade && apk add --no-cache bash git openssh
