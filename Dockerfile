FROM node:14.17-alpine

RUN apk update
RUN apk upgrade
RUN apk add python cmake make g++

WORKDIR /usr/src
COPY app/ /usr/src/
RUN mv config.json.docker config.json
RUN npm install --production

RUN apk del python cmake make g++

VOLUME [ "/config" ]
EXPOSE 2222/tcp
ENTRYPOINT [ "/usr/local/bin/node", "index.js" ]
