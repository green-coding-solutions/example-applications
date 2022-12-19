# Introduction

This is the build directory for the `puppeteer-chrome` and `puppeteer-firefox` images.  
Which are Alpine images with Chrome/Firefox and puppeteer installed.

## Building

Run `docker compose build` to build the images and use them for testing or  
instrumented by the Green Metrics Tool runner.

## Using this container for development

A simple puppeteer script that fetches data from the <green-coding.org> is present  
in this directory in a Firefox and Chrome variant.  

### Firefox

Run `docker compose run puppeteer-firefox` to start the Firefox container  
and then you can run the puppeteer script by calling:

```sh
node puppeteer-image-test-firefox.js
```

The Firefox browser is available inside the container as `firefox`.

### Chrome

Run `docker compose run puppeteer-chrome` to start the Chrome container  
and then you can run the puppeteer script by calling:

```sh
node puppeteer-image-test-chrome.js
```

The Chrome browser is available inside the container as `chromium-browser` and  
it needs to be started along with the argument `--no-sandbox`.
