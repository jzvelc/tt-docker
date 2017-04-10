FROM node:6.10-alpine

# Install base packages
RUN apk add --no-cache \
    bash \
  && rm -rf /var/cache/apk/*

# Install dumb init
RUN apk add --no-cache --repository http://dl-4.alpinelinux.org/alpine/v3.5/community \
    dumb-init \
  && rm -rf /var/cache/apk/*

ADD dockerize-alpine-linux-amd64-v0.3.0.tar.gz /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

WORKDIR /data
COPY server.js /data/server

ENTRYPOINT ["dumb-init", "--rewrite", "2:3", "--", "/entrypoint.sh"]

EXPOSE 80

CMD ["node", "server.js"]
