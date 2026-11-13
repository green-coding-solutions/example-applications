# Agent Guide

Scope: run a basic WordPress starter setup and access it with Playwright.

## Scenario

- `usage_scenario.yml`: visits the starter WordPress instance, mainly to measure startup and basic access cost.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `wordpress.conf`

## Agent Notes

- This is the lighter-weight WordPress example for startup and install-page access, not seeded content.
- Browser behavior is defined inline in `usage_scenario.yml` via `type: playwright` commands (GMT helper `gmt-playwright.yml`).
- `compose.yml` is only for local development; `usage_scenario.yml` is self-contained.
- Use `wordpress-official-data` instead when the task needs an imported site with real content.
