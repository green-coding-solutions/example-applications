FROM node:19-alpine3.16

RUN apk add chromium curl ttf-freefont pciutils udev

WORKDIR /var/www
COPY ./package.json /var/www/package.json
RUN npm i

ENTRYPOINT [ "sh" ]
