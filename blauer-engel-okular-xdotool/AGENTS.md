# Agent Guide

Scope: replay the KDE Okular desktop workflow used for the Blauer Engel measurement.

## Scenario

- `usage_scenario.yml`: runs the `xdotool` script against a real X11 desktop.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`
- `standardnutzungsseznarioKDEOkular.xdo`

## Agent Notes

- This example is tightly bound to Ubuntu 22.04, a `2560x1440` display, and a specific desktop layout.
- It depends on a host X11 socket mount and an available display such as `:1`.
- Treat this as a manual or highly controlled environment scenario, not a generic CI target.
- `README.md` contains the exact host-state assumptions and should be read before any execution attempt.
