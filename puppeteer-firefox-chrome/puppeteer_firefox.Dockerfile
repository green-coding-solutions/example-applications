FROM node:18-alpine3.16

RUN apk add firefox curl udev ttf-freefont pciutils

WORKDIR /var/www
COPY ./package.json /var/www/package.json
RUN PUPPETEER_PRODUCT=firefox npm i

ENTRYPOINT [ "sh" ]
