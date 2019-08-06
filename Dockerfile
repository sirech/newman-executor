ARG TAG
FROM node:${TAG}-alpine

RUN npm i -g newman

RUN apk add --update --no-cache bash gettext \
  && rm -rf /var/cache/apk/*
