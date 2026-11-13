# Agent Guide

Scope: run a non-headless Firefox workflow in Docker and display it via X11 on the host.

## Scenario

- `usage_scenario.yml`: starts a WordPress target and a GUI Playwright flow via the GMT helper `gmt-playwright-headful.yml`.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`

## Agent Notes

- This example requires host X11 socket access and typically needs `--allow-unsafe`.
- It is a GUI scenario; failures may come from display access rather than the browser script itself.
- Browsing behavior is defined inline in `usage_scenario.yml` via `type: playwright` commands; display wiring (X11 mount, `DISPLAY`) comes from the GMT helper.
- `compose.yml` only contains the WordPress target for local debugging.
- `README.md` is the human-facing explanation of the X11 model.
