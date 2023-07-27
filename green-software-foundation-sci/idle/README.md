# Introduction

This is the build directory for the `gcb-idle` image, which is basically just an alpine image.  
In a usage flow this can be used to see how much resources the actual container uses by sleeping for `n` seconds.

## Building

Run `docker compose build` to build the container and use it for testing or
instrumented by the Green Metrics Tool runner.
