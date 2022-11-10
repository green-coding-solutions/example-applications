## Intro
This is the build directory for the `puppeteer-chrome` and `puppeteer-firefox`
containers. Which is are ubuntu image with chrome/ firefox and puppeteer installed.

For the firefox package you can start it with docker compose and the run firefox in the docker container
while seeing the firefox window in your X session. We can't get this working for chrome.


## Building

Run `docker compose build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.


## Using this container for development

Run `docker compose run idle` to start and enter the container.

It will just end when you just do `docker compose run`