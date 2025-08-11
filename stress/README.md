# Introduction

This is an example on how to run `stress-ng` in our tool and see how the CPU behaves.
This example stresses one core for 5 seconds.

## Building

Run `docker compose build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.

## Using this container for development

Run `docker compose run stress` to start and enter the container.

It will just end when you just do `docker compose run`

## OpenEnergyBadge
These badges show the energy cost for running this code on a single machine.

- <a href="https://metrics.green-coding.io/stats.html?id=d2600846-b9b5-47a3-aa41-08ae02d36c8c"><img src="https://api.green-coding.berlin/v1/badge/single/d2600846-b9b5-47a3-aa41-08ae02d36c8c?metric=psu_energy_ac_mcp_machine"></a>
- <a href="https://metrics.green-coding.io/stats.html?id=d2600846-b9b5-47a3-aa41-08ae02d36c8c"><img src="https://api.green-coding.berlin/v1/badge/single/d2600846-b9b5-47a3-aa41-08ae02d36c8c?metric=cpu_energy_rapl_msr_component"></a>

