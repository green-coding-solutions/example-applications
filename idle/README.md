# Introduction

This is the build directory for the `alpine-idle` image, which is basically just an alpine image.  
In a usage flow this can be used to see how much resources the actual container uses by sleeping for `n` seconds.

## Building

Run `docker compose build` to build the container and use it for testing or
instrumented by the Green Metrics Tool runner.

## Using this container for development

Run `docker compose run idle` to start and enter the container.

It will just end when you just do `docker compose run`.
