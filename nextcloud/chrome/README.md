# Nextcloud using Chrome with various DBs

This folder contains the Nextcloud benchmarks using the Chrome browser and Apache. There are following databases used:
 - MariaDB (Formerly MySQL)
 - Postgres
 - SqLite. Which is in the Nextcloud docker image and not as a separate container.

We use 3 containers.
- db: which is the database. (Except in the SqLite case)
- puppeteer: which emulates the user clicking on things
- app: the Nextcloud app pulled from dockerhub

We used the original docker-compose files supplied under https://github.com/nextcloud/docker and haven't modified them
except the password.