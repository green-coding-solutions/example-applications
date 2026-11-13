# Agent Guide

Scope: run a WordPress site with seeded content and drive it with Playwright.

## Scenario

- `usage_scenario.yml`: boots MariaDB and WordPress from bundled data, then runs the Playwright user journey defined inline via `type: playwright` commands (GMT helper `gmt-playwright.yml`).

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile-wordpress`
- `Dockerfile-mariadb`
- `wordpress-dump.sql`
- `wordpress.conf`

## Agent Notes

- The database bootstrap is intentionally slow; the scenario uses a MariaDB healthcheck so WordPress only starts once the dump is imported.
- `compose.yml` is only for local debugging; `usage_scenario.yml` is self-contained.
- Ignore nested vendor docs under `html/` unless the task is specifically about the bundled WordPress app internals.
- Use this example for pre-populated WordPress behavior, not for fresh-install flows.
- `README.md` contains detailed local-debugging and credential notes.
