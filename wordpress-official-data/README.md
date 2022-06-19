## WordPress with MariaDB and dump

This example defines a wordpress container architecture, that consumes a copy of a filesystem
and also an SQL dump.

It is based on [WordPress image page](https://hub.docker.com/_/wordpress).

When deploying this setup, docker compose maps the WordPress container port 9875 to
port 9875 of the host as specified in the compose file.

This image is meant to be used when you want to test a final made site.
It will consume the dump in `wordpress-dump.sql` and will map the filesystem in `html`
to the webserver document root for Wordpress.

## Prerequisites

This container architecture requires the Green Coding Puppeteer docker image
 to be present. Be sure to check out ZZZ to build it.

## Deploy with docker compose

```
$ docker compose up -d
```

## Set hostnames for local development

Please set in `/etc/hosts` the following entry:
`127.0.0.1 gmt-apache-wordpress`


## Expected result

Check containers are running and the port mapping:
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                 NAMES
195d682b21b0    docker.io/library/wordpress:latest        "docker-entrypoint.s…"    8 minutes ago    Up                          0.0.0.0:9875->9875/tcp    green-coding-wordpress-data-apache
3aeaa01a5604    docker.io/library/ubuntu:latest           "/bin/bash -c cp -R …"    8 minutes ago    Exited (0) 8 minutes ago                              wordpress-mariadb-data_migrate_1
69c51217731e    docker.io/library/mariadb:10.6.4-focal    "docker-entrypoint.s…"    8 minutes ago    Up                                                    green-coding-wordpress-data-mariadb
```

Navigate to `http://gmt-apache-wordpress:9875` in your web browser to access WordPress.

Stop and remove the containers

```
$ docker compose down
```

Once you are finished testing and want to remove all WordPress data, delete the named volumes by passing the `-v` parameter.:
```
$ docker compose down -v
```

## Using created database / filesystem later on

Our sample container XXX can consume a pre-made filesystem directly. See documentation there how to use it.

In order to extract the relevant filesystem from these containers here use:

```
$ docker cp green-coding-wordpress-basic-mariadb:/var/lib/mysql ./mysql
$ docker cp green-coding-wordpress-basic-apache:/var/www/html ./html
```


## Testing

Please note that this example expects our Puppeteer container to be built on your system from
here: ZZZ

Also you need to recreate the relevant parts from your `compose.yml` in the setup part of
the `usage_scenario.json`. This is needed du to security restrictions of not sending
the compose instructions directly to the docker daemon.

To check how to run the tests check out: AAA
