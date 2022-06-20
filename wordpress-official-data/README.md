## WordPress with MariaDB and dump

This example defines a wordpress container architecture.

The architecture is prepared in Dockerfiles where the MariaDB consumes a dump
and the Apache gets supplied a Wordpress folder structure in the document root.

It is based on [WordPress image page](https://hub.docker.com/_/wordpress).

When deploying this setup, docker compose maps the WordPress container port 9875 to
port 9875 of the host as specified in the compose file.

## Prerequisites

This container architecture requires the Green Coding Puppeteer docker image
 to be present. 

Be sure to to build it from here: https://github.com/green-coding-berlin/example-applications/tree/main/puppeteer

## Deploy with docker compose

```
$ docker compose up -d
```

## Set hostnames for local debugging

Please set in `/etc/hosts` the following entry:
`127.0.0.1 green-coding-wordpress-apache-data-container`


## Expected result

Check containers are running and the port mapping:
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                 NAMES
d6b30f1b29d5   wordpress-mariadb-data_wordpress     "docker-entrypoint.s…"   49 seconds ago   Up 31 seconds   80/tcp, 0.0.0.0:9875->9875/tcp, :::9875->9875/tcp   green-coding-wordpress-apache-data-container
a9933367edde   wordpress-mariadb-data_db            "docker-entrypoint.s…"   49 seconds ago   Up 31 seconds   3306/tcp                                            green-coding-wordpress-mariadb-data-container
```

Navigate to `http://green-coding-wordpress-apache-data-container:9875` in your web browser to access WordPress.

Stop and remove the containers

```
$ docker compose down
```

Once you are finished testing and want to remove all WordPress data, delete the named volumes by passing the `-v` parameter.:
```
$ docker compose down -v
```

## Pecularities

The MariaDB database takes a long time to boot.

Therefore a `sleep 20` is in the `setup-commands` of the `usage_scenario.json` so that Puppeteer will not 
get a database connection error from Wordpress.

## Running the measurement

To check how to run the measurements check out our [Documentation](https://docs.green-coding.org)