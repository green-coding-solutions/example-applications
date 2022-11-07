## Intro
This example shows how you can run a web browser in one docker container and a 
server in another while showing the window on the actual "user" screen. This 
works through X11 being able to forward everything it renders to another X11 server. 
This blog post gives a good overview: https://goteleport.com/blog/x11-forwarding/

## Building

Run `docker compose build` to build the containers and use them for testing or
instrumented by the Green Metrics Tool runner.

## Using this container for development

Run `docker compose run idle` to start and enter the container.

It will just end when you just do `docker compose run`
