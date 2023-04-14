# Introduction

This is an example on how to run `stress-ng` in our tool and see how the CPU behaves.
Very much like the example in `../stress` this example stesses the CPU except it increases the core count every
5 seconds.

## Building

Run `docker compose build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.

## Using this container for development

Run `docker compose run stress` to start and enter the container.

It will just end when you just do `docker compose run`
