# Introduction

This is an example on how to run `stress-ng` in our tool and see how the CPU behaves.
This example stresses one core for 5 seconds.

## Building

Run `docker compose -f ../shared/stress/compose.yml build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.

Please note that the `compose.yml` file is a symlink into the `../shared/stress/` folder!

## Using this container for development

Run `docker compose run stress` to start and enter the container.

It will just end when you just do `docker compose run`

## OpenEnergyBadge
These badges show the energy cost for running this code on a single machine.

- <a href="https://metrics.green-coding.berlin/stats.html?id=433595cc-e397-4a0e-bc74-7ca832dd318a"><img src="https://api.green-coding.berlin/v1/badge/single/433595cc-e397-4a0e-bc74-7ca832dd318a?metric=ml-estimated"></a>
- <a href="https://metrics.green-coding.berlin/stats.html?id=433595cc-e397-4a0e-bc74-7ca832dd318a"><img src="https://api.green-coding.berlin/v1/badge/single/433595cc-e397-4a0e-bc74-7ca832dd318a?metric=RAPL"></a>
- <a href="https://metrics.green-coding.berlin/stats.html?id=433595cc-e397-4a0e-bc74-7ca832dd318a"><img src="https://api.green-coding.berlin/v1/badge/single/433595cc-e397-4a0e-bc74-7ca832dd318a?metric=DC"></a>
