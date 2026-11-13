# WordPress with MariaDB and dump

This example defines a wordpress container architecture.

The architecture is prepared in Dockerfiles where the MariaDB consumes a dump
and the Apache gets supplied a Wordpress folder structure in the document root.

It is based on [WordPress image page](https://hub.docker.com/_/wordpress).

When deploying this setup, docker compose maps the WordPress container port 9875 to
port 9875 of the host as specified in the compose file.

## Prerequisites

The browser is provided by the GMT Playwright helper (`compose-file: !include-gmt-helper gmt-playwright.yml`).
The user journey is defined directly in the `usage_scenario.yml` via `type: playwright` commands.
See [Measuring Websites](https://docs.green-coding.io/docs/measuring/measuring-websites/) for details.

The `compose.yml` is only meant for local debugging with `docker compose`. The `usage_scenario.yml` is self-contained.

## Deploy with docker compose

``` bash
docker compose up -d
```

## Set hostnames for local debugging

Please set in `/etc/hosts` the following entry:
`127.0.0.1 gcb-wordpress-apache`

## Expected result

Check containers are running and the port mapping:

``` bash
$ docker compose ps -a
NAME                    IMAGE                   COMMAND                  SERVICE                CREATED              STATUS              PORTS
gcb-wordpress-apache    gcb_wordpress_apache    "docker-entrypoint.s…"   gcb-wordpress-apache   About a minute ago   Up 4 seconds        80/tcp, 0.0.0.0:9875->9875/tcp, :::9875->9875/tcp
gcb-wordpress-mariadb   gcb_wordpress_mariadb   "docker-entrypoint.s…"   gcb-wordpress-mariadb   7 minutes ago        Up 7 seconds        3306/tcp
```

Navigate to `http://gcb-wordpress-apache:9875` in your web browser to access WordPress.

Stop and remove the containers

``` bash
docker compose down
```

Once you are finished testing and want to remove all WordPress data you have to remove the image and delete the layer cache since we copy the data in:

``` bash
docker compose down -v
docker rmi -f gcb_wordpress_mariadb
docker system prune --volumes
```

## Peculiarities

The MariaDB database takes a long time to boot.

Therefore the `usage_scenario.yml` defines a healthcheck on the MariaDB container and WordPress only starts once it
is healthy, so that Playwright will not get a database connection error from Wordpress.

## Changing the data in the admin

Go to http://gcb-wordpress-apache:9875/wp-admin/ and use:
- Username: arne
- Password: arne

## Running the measurement

To check how to run the measurements check out our [Documentation](https://docs.green-coding.berlin)

## OpenEnergyBadge
These badges show the energy cost for running this code on a single machine.

- <a href="https://metrics.green-coding.io/stats.html?id=898f8b5d-fb33-473f-8b9b-a0dba091e39f"><img src="https://api.green-coding.io/v1/badge/single/898f8b5d-fb33-473f-8b9b-a0dba091e39f?metric=psu_energy_ac_mcp_machine"></a>
- <a href="https://metrics.green-coding.io/stats.html?id=898f8b5d-fb33-473f-8b9b-a0dba091e39f"><img src="https://api.green-coding.io/v1/badge/single/898f8b5d-fb33-473f-8b9b-a0dba091e39f?metric=cpu_energy_rapl_msr_component"></a>
- <a href="https://metrics.green-coding.io/stats.html?id=898f8b5d-fb33-473f-8b9b-a0dba091e39f"><img src="https://api.green-coding.io/v1/badge/single/898f8b5d-fb33-473f-8b9b-a0dba091e39f?metric=software_carbon_intensity_global"></a>



