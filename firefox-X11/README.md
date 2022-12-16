# Introduction

This example shows how you can run a web browser in one docker container and a
server in another while showing the window on the actual "user" screen.  
This works through X11 being able to forward everything it renders to another X11 server.  
This [blog post](https://goteleport.com/blog/x11-forwarding/) gives a good overview.

## Building

Run `docker compose build` to build the images and use them for testing or
instrumented by the Green Metrics Tool runner.

**Note:** When running the benchmark, with the `runner.py` in the green metrics tool, you will need to add the `--allow-unsafe` option to allow for the mounting of the volumes so that X can connect to the correct socket.

## Using this container for development

Run `docker compose run idle` to start and enter the container.

It will just end when you just do `docker compose run`
