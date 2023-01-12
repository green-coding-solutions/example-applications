# WordPress with MariaDB

This example defines the starting setup to create a wordpress container architecture
to be tested with the [Green Metrics Tool](https://github.com/green-coding-berlin/green-metrics-tool)

It is based on [WordPress image page](https://hub.docker.com/_/wordpress).

When deploying this setup, docker compose maps the WordPress container port 9875 to
port 9875 of the host as specified in the compose file.

This image is meant to be used when you want to start building a wordpress container for testing from the
base image.
The `compose.yml` file will create volumes for you so that the state of the database and filesystem persists between container
rebuilds.

If you do want to start with an importable SQL dump / filesystem or example here: <https://github.com/green-coding-berlin/example-applications/tree/main/wordpress-official-data>

## Prerequisites

This example uses our [Puppeteer Chrome Container](https://hub.docker.com/r/greencoding/puppeteer-chrome) and will download
it on the first measurement if you did not already pull it.

If you do want to alter this container you can also build it yourself from [Puppeteer Chrome Container](https://github.com/green-coding-berlin/example-applications/tree/main/puppeteer-firefox-chrome).
Only be sure to update the `usage_scenario.yml` with the local image identifier.

## Deploy with docker compose

``` bash
docker compose up -d
```

## Set hostnames for local development

Please set in `/etc/hosts` the following entry:
`127.0.0.1 gcb-wordpress`

## Expected result

Check containers are running and the port mapping:

``` bash
$ docker ps
CONTAINER ID   IMAGE                          COMMAND                  CREATED         STATUS         PORTS                                               NAMES
150c04999d16   wordpress:latest               "docker-entrypoint.s…"   6 seconds ago   Up 5 seconds   80/tcp, 0.0.0.0:9875->9875/tcp, :::9875->9875/tcp   gcb-wordpress
18be22cee196   mariadb:10.6.4-focal           "docker-entrypoint.s…"   6 seconds ago   Up 6 seconds   3306/tcp                                            gcb-mariadb
```

Navigate to `http://gcb-wordpress:9875` in your web browser to access WordPress.

Stop and remove the containers

``` bash
docker compose down
```

Once you are finished testing and want to remove all WordPress data, delete the named volumes by passing the `-v` parameter:

``` bash
docker compose down -v
```

## Using created database / filesystem later on

Our [sample container architecture](https://github.com/green-coding-berlin/example-applications/tree/main/wordpress-official-data) can consume a pre-made filesystem directly. See documentation there how to use it.

In order to extract the relevant filesystem from these containers here use:

``` bash
mysqldump -uwordpress -pwordpress wordpress > /tmp/wordpress-dump.sql # inside the container
docker cp green-coding-wordpress-basic-mariadb:/tmp/wordpress-dump.sql ./wordpress-dump.sql
docker cp green-coding-wordpress-basic-apache:/var/www/html ./html
```

## Saving container for testing

``` bash
docker commit green-coding-wordpress-basic-apache green-coding-wordpress-basic-apache-final-image
docker commit green-coding-wordpress-basic-mariadb green-coding-wordpress-basic-mariadb-final-image
```

Also you need to recreate the relevant parts from your `compose.yml` in the setup part of  
the `usage_scenario.yml`. This is needed du to security restrictions of not sending  
the compose instructions directly to the docker daemon.

## Running measurements

To check how to run the measurements check out our [Documentation](https://docs.green-coding.org)
