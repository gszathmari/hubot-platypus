FROM node:5

MAINTAINER Gabor Szathmari "gszathmari@gmail.com"

ENV APPLICATION_NAME hubot-platypus
ENV PORT 80

RUN mkdir /app

COPY *.json /app/
COPY bin/ /app/bin
COPY scripts/ /app/scripts

WORKDIR /app

RUN npm install

CMD ["./bin/hubot", "-a", "slack"]

EXPOSE 80:8089
