# Benchmarking Nextcloud

What is Nextcloud? A safe home for all your data. Access & share your files, calendars, contacts, mail & more from any device, on your terms.

Most of the Nextcloud is based of the code supplied in <https://github.com/nextcloud/docker> please refer to this documentation for everything Nextcloud dependent.

## Directories

In this example we want to demonstrate how the green metrics tool can help you to evaluate design decisions based on
resource usage. So we try show a breath of various configurations you can then evaluate in the frontend.

We evaluate the two browsers Chrome and Firefox. Also the three databases MariaDB, Postgres and SqLite. This is reflected in
the directory structure.


There are two main ways to deploy Nextcloud with docker. One is via apache and one is using FPM we also include an example
for FPM but for simplicity only do this with MariaDB and Chrome.


### apache

The compose file is copy pasted from <https://github.com/nextcloud/docker#base-version---apache>
We set a bogus password for `*_ROOT_PASSWORD` and `*_PASSWORD` as the GMT requires environment variables to be set.

### FPM

The compose file is copy pasted from <https://github.com/nextcloud/docker#base-version---fpm>
Again with bogus passwords as with apache.


## Puppeteer files
- nextcloud_install_puppeteer.js: Installs Nextcloud and creates a admin user. Also installs all apps that are
  available.
- nextcloud_create_event_puppeteer.js: This script logs into Nextcloud and then creates an event and checks if it then
  subsequently shows up in the calender view.

## Running

You will need to supply the `--skip-unsafe` to the runner as there are ports defined in the `compose.yml`

## Debugging tips

Sometimes the puppeteer files will fail and it is unclear why. To easily debug this uncomment
```
    # volumes:
    #   - /tmp/.X11-unix:/tmp/.X11-unix
    # environment:
    #   DISPLAY: ":0"
```
in the `usage_scenario.yml` file.
Then enable head full mode by `headless: false,` in the puppeteer file. Don't forget to `xhost +` on the host system.
If you have multiple displays you will also need to edit the `DISPLAY: ":0"`.


## ToDo
- Refactor the puppeteer files: Currently we have just copy and pasted the same file in every directory. In some cases
  we did some minor adjustments. This could be done cleaner through a make script or similar.
- More puppeteer cases