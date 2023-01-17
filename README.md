# Introduction

This is the repo in which we at Green Coding collect some example applications that you can use to get to know the
green metrics tool: <https://github.com/green-coding-berlin/green-metrics-tool>

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

## Notes

In order to avoid code duplication we have created a `./shared` folder in which we have placed files that are
generally shared between multiple examples. For example the `stress`, `stress-10` and `stress-step` all share the
same dockerfile but vary in their measurement setup. So we have placed the docker file in the `shared` folder an
symlinked the file into the various directories. Please keep this in mind when editing files.
