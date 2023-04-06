# Benchmarking Nextcloud

What is Nextcloud? A safe home for all your data. Access & share your files, calendars, contacts, mail & more from any device, on your terms.

Most of the Nextcloud is based of the code supplied in <https://github.com/nextcloud/docker> please refer to this documentation for everything Nextcloud dependent.

## Directories

There are two main ways to deploy Nextcloud with docker. One is via apache and one is using FPM.

### apache

The compose file is copy pasted from <https://github.com/nextcloud/docker#base-version---apache>

We set a bogus password for `MYSQL_ROOT_PASSWORD` and `MYSQL_PASSWORD` as the GMT requires environment variables to be set

### FPM

The compose file is copy pasted from <https://github.com/nextcloud/docker#base-version---fpm>

Again with bogus passwords as with apache.

The `nextcloud_install.js` will run a Puppeteer script that creates an admin user account  
for the purposes of installation and then install the recommended apps as well.

## Running

You will need to supply the `--skip-unsafe` to the runner as there are ports defined in the `compose.yml`
