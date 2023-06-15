# Purpose

This reporter will transfer a file internally between docker containers
and also externally by downloading from the internet.

It is designed to test the [Network Reporter](https://docs.green-coding.berlin/docs/measuring/metric-providers/network-io-cgroup-container/) of the Green Metrics Tool and  
its display in the [Green Metrics Dashboard](https://metrics.green-coding.berlin).

## Building

Run `docker compose build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.
