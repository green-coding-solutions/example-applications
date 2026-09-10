# Agent Guide

Scope: run a seeded Drupal site and execute a Puppeteer browser flow against it.

## Scenario

- `usage_scenario.yml`: boots MariaDB and Drupal, copies the browser flow, then runs the Playwright flow twice with an idle gap.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile-drupal`
- `Dockerfile-mariadb`
- `playwright-flow.js`
- `drupal.sql`
- `drupal.conf`
- `settings.php`

## Agent Notes

- MariaDB readiness is gated by a real `healthcheck` (mysqladmin ping), not a blind sleep; `gcb-playwright` depends on it via `condition: service_healthy`.
- `folder-destination: "/tmp/repo"` is used so the Playwright container can copy `playwright-flow.js`.
- The `mcr.microsoft.com/playwright` image doesn't ship the `playwright` npm package itself, so a setup-command installs it into `/app` before the script runs.
- If the task is about the browsing behavior, inspect `playwright-flow.js` before touching container definitions.
- This directory had no local doc before; use this file as the primary entry point.
