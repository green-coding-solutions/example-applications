## Intro
This is an example on how to run `stress-ng` in our tool. 
In the `usage_scenario.yml` file you can specify on how many cores and for
how long you want to run the stress test. Initially we use one core for 5 
seconds. The commented line runs on 10 cores for 5 seconds.

## Building

Run `docker compose build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.

## Using this container for development

Run `docker compose run stress` to start and enter the container.

It will just end when you just do `docker compose run`