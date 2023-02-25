# Introduction

This is an example on how to detach processes with the Green Metrics Tool
that should run in the background during a `usage_scenario` execution.

## Building

Run `docker compose -f ../shared/stress/compose.yml build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.

Please note that the `compose.yml` file is a symlink into the `../shared/stress/` folder!

## Using this container for development

Run `docker compose run stress` to start and enter the container.

It will just end when you just do `docker compose run`
