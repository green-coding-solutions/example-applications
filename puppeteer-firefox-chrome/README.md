# Introduction

This is the build directory for the `puppeteer-chrome` and `puppeteer-firefox` images.  
Which are Alpine images with Chrome/Firefox and puppeteer installed.

## Downloading

These images are available in their newest tested version on Docker Hub.

We recommend pulling them from there, which saves resources as well as gives you
a working setup.

- `docker pull greencoding/puppeteer-chrome` or
- `docker pull greencoding/puppeteer-firefox`

If you want the newest testing version (potentially unstable) use:

- `docker pull greencoding/puppeteer-chrome:testing` or
- `docker pull greencoding/puppeteer-firefox:testing`

## Building locally

For production use we recommend using the published containers on Docker Hub.

If you want to build a local copy or modified variant run either:

- `docker build -f puppeteer_firefox.Dockerfile . -t gcb_puppeteer_firefox:local` or
- `docker build -f puppeteer_chrome.Dockerfile . -t gcb_puppeteer_chrome:local`

to build the images and use them for testing or instrumented by the Green Metrics Tool runner.

## Running

```bash
docker compose run gcb-puppeteer-chrome
# or
docker compose run gcb-puppeteer-firefox
```

If you do not want to use the the docker compose method or you want to easily bind more parameters / use a different  
image use the docker run command like so:

```console
# Example for chrome
docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/puppeteer-image-test-chrome.js:/var/www/puppeteer-image-test-chrome.js gcb_puppeteer_chrome:local
```

## Using this container for development

A simple puppeteer script that fetches data from the <green-coding.org> is present  
in this directory in a Firefox and Chrome variant.  

### Using Firefox

Run `docker compose run puppeteer-firefox` to start the Firefox container  
and then you can run the puppeteer script by calling:

```sh
node puppeteer-image-test-firefox.js
```

The Firefox browser is available inside the container as `firefox`.

### Using Chrome

Run `docker compose run puppeteer-chrome` to start the Chrome container  
and then you can run the puppeteer script by calling:

```sh
node puppeteer-image-test-chrome.js
```

The Chrome browser is available inside the container as `chromium-browser` and  
it needs to be started along with the argument `--no-sandbox`.
