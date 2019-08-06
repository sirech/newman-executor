FROM node:12.6-alpine

RUN npm i -g newman

RUN apk add --update --no-cache bash gettext \
  && rm -rf /var/cache/apk/*
