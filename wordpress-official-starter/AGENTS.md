# Agent Guide

Scope: run a basic WordPress starter setup and access it with Playwright.

## Scenario

- `usage_scenario.yml`: visits the starter WordPress instance, mainly to measure startup and basic access cost.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `playwright-flow.py`
- `wordpress.conf`

## Agent Notes

- This is the lighter-weight WordPress example for startup and install-page access, not seeded content.
- If the task changes browser behavior, start with `playwright-flow.py`.
- Use `wordpress-official-data` instead when the task needs an imported site with real content.
