# Introduction

This example shows how you can run a web browser in one docker container and a
server in another while showing the window on the actual "user" screen.  
This works through X11 being able to forward everything it renders to another X11 server.  
This [blog post](https://goteleport.com/blog/x11-forwarding/) gives a good overview.

## Browser

The browser is provided by the GMT Playwright helper for non-headless browsers
(`compose-file: !include-gmt-helper gmt-playwright-headful.yml`).
It starts Firefox with a GUI, mounts `/tmp/.X11-unix` and sets `DISPLAY=":0"`.  
The user journey is defined directly in the `usage_scenario.yml` via `type: playwright` commands.  
See [Measuring Websites](https://docs.green-coding.io/docs/measuring/measuring-websites/) for details.

If you have multiple displays, override `DISPLAY` for the `gmt-playwright-nodejs` service in the `usage_scenario.yml`.

**Note:** When running the benchmark, with the `runner.py` in the green metrics tool, you will need to add the `--allow-unsafe` option to allow for the mounting of the volumes so that X can connect to the correct socket.

You may also need to allow local docker containers to access your X server, e.g. via `xhost +local:docker`.

## Using this container for development

The `compose.yml` only contains the WordPress target for local debugging:

```bash
docker compose up -d
```

WordPress is then reachable on `http://localhost:9875`.
