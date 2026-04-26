# Agent Guide

Scope: run a WordPress site with seeded content and drive it with Puppeteer.

## Scenario

- `usage_scenario.yml`: boots MariaDB and WordPress from bundled data, then runs `puppeteer-flow.js`.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile-wordpress`
- `Dockerfile-mariadb`
- `puppeteer-flow.js`
- `wordpress-dump.sql`
- `wordpress.conf`

## Agent Notes

- The database bootstrap is intentionally slow; the scenario includes startup sleeps for this reason.
- Ignore nested vendor docs under `html/` unless the task is specifically about the bundled WordPress app internals.
- Use this example for pre-populated WordPress behavior, not for fresh-install flows.
- `README.md` contains detailed local-debugging and credential notes.
