## Intro

This is the build directory for the `alpine-idle` container. Which basically is 
just an alpine container. In a flow this can be used to see how much resources 
the actual container uses by sleeping for `n` seconds.


## Building

Run `docker compose build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.


## Using this container for development

Run `docker compose run idle` to start and enter the container.

It will just end when you just do `docker compose run`