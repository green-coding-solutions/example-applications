FROM node:18-alpine3.16

RUN apk add chromium curl ttf-freefont pciutils udev

WORKDIR /var/www
COPY ./package.json /var/www/package.json
COPY ./puppeteer-image-test-chrome.js /var/www/puppeteer-image-test-chrome.js
RUN npm i

ENTRYPOINT [ "sh" ]
