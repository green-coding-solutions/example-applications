FROM node:19-alpine3.16

RUN apk add firefox curl

WORKDIR /var/www
COPY ./package.json /var/www/package.json
RUN PUPPETEER_PRODUCT=firefox npm i

# Container must run as the root user, otherwise we cannot connect to the Display.
# A more security concerned way would be to run the container with the user of the system

ENTRYPOINT [ "sh" ]
