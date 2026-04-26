# Agent Guide

Scope: run a non-headless Firefox workflow in Docker and display it via X11 on the host.

## Scenario

- `usage_scenario.yml`: starts a WordPress target and a GUI browser automation flow.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `package.json`
- `puppeteer-flow.js`

## Agent Notes

- This example requires host X11 socket access and typically needs `--allow-unsafe`.
- It is a GUI scenario; failures may come from display access rather than the browser script itself.
- Use `puppeteer-flow.js` for browsing behavior changes and `compose.yml` for display wiring.
- `README.md` is the human-facing explanation of the X11 model.
