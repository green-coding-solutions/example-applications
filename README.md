[![Examples Directory Tests Run - VM](https://github.com/green-coding-solutions/example-applications/actions/workflows/examples-application-testing-vm.yml/badge.svg)](https://github.com/green-coding-solutions/example-applications/actions/workflows/examples-application-testing-vm.yml)

# Introduction

This is the repo in which we at Green Coding collect some example applications that you can use to get to know the
green metrics tool: <https://github.com/green-coding-solutions/green-metrics-tool>

Every directory contains it's own README with more details on what each example does.

Some interesting examples are:

- `./ml-model`: Which runs a little ml model and enables us to benchmark ml tasks
- `./stress`: Which is a very simple entry point into benchmarking and shows how to run a little stress test
- `./wordpress-official-data`: Which shows you how to analyze a wordpress installation including server and browser

## How to use

Please see the [documentation](https://docs.green-coding.berlin/docs/contributing/example-applications-contribution/)

## Building and starting

`docker compose up`

## Changing after rebuild

If you make changes to the Dockerfile remember to use `docker compose build` to rebuild.
