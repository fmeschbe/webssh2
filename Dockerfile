FROM node:14.17-alpine

WORKDIR /usr/src
COPY app/ /usr/src/
RUN mv config.json.docker config.json
RUN npm install --production

VOLUME [ "/config" ]
EXPOSE 2222/tcp
ENTRYPOINT [ "/usr/local/bin/node", "index.js" ]
