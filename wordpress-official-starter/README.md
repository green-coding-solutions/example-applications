## WordPress with MariaDB


This example defines the starting setup to create a wordpress container architecture
to be tested with the [Green Metrics Tool](https://github.com/green-coding-berlin/green-metrics-tool)

It is based on [WordPress image page](https://hub.docker.com/_/wordpress).

When deploying this setup, docker compose maps the WordPress container port 9875 to
port 9875 of the host as specified in the compose file.

This image is meant to be used when you want to start building a wordpress container for testing from the
base image.
The `compose.yml` file will create volumes for you so that the state of the database and fileystem persists between container
rebuilds.

If you do want to start with an importable SQL dump / fileystem or example here: https://github.com/green-coding-berlin/example-applications/tree/main/wordpress-mariadb-data

## Deploy with docker compose

```
$ docker compose up -d
```

## Set hostnames for local development

Please set in `/etc/hosts` the following entry:
`127.0.0.1 green-coding-wordpress-apache-basic-container`


## Expected result

Check containers are running and the port mapping:
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                 NAMES
195d682b21b0    docker.io/library/wordpress:latest        "docker-entrypoint.s…"    8 minutes ago    Up                          0.0.0.0:9875->9875/tcp    green-coding-wordpress-basic-apache
69c51217731e    docker.io/library/mariadb:10.6.4-focal    "docker-entrypoint.s…"    8 minutes ago    Up                                                    green-coding-wordpress-basic-mariadb
```

Navigate to `http://green-coding-wordpress-apache-basic-container:9875` in your web browser to access WordPress.

Stop and remove the containers

```
$ docker compose down
```

Once you are finished testing and want to remove all WordPress data, delete the named volumes by passing the `-v` parameter.:
```
$ docker compose down -v
```

## Using created database / filesystem later on

Our [sample container architecture](https://github.com/green-coding-berlin/example-applications/tree/main/wordpress-mariadb-data) can consume a pre-made filesystem directly. See documentation there how to use it.

In order to extract the relevant filesystem from these containers here use:

```
$ mysqldump -uwordpress -pwordpress wordpress > /tmp/wordpress-dump.sql # inside the container
$ docker cp green-coding-wordpress-basic-mariadb:/tmp/wordpress-dump.sql ./wordpress-dump.sql
$ docker cp green-coding-wordpress-basic-apache:/var/www/html ./html
```

## Saving container for testing

```
$ docker commit green-coding-wordpress-basic-apache green-coding-wordpress-basic-apache-final-image
$ docker comming green-coding-wordpress-basic-mariadb green-coding-wordpress-basic-mariadb-final-image
```

Also you need to recreate the relevant parts from your `compose.yml` in the setup part of
the `usage_scenario.json`. This is needed du to security restrictions of not sending
the compose instructions directly to the docker daemon.

Please note that this example expects our [Puppeteer container](https://github.com/green-coding-berlin/example-applications/tree/main/puppeteer) to be built on your system.

If you want to use your own be sure to alter the `usage_scenario.json`

## Running measurements

To check how to run the measurements check out our [Documentation](https://docs.green-coding.org)