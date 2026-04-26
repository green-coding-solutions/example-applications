# Agent Guide

Scope: run a seeded Drupal site and execute a Puppeteer browser flow against it.

## Scenario

- `usage_scenario.yml`: boots MariaDB and Drupal, copies the browser flow, then runs Puppeteer twice with an idle gap.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile-drupal`
- `Dockerfile-mariadb`
- `puppeteer-flow.js`
- `drupal.sql`
- `drupal.conf`
- `settings.php`

## Agent Notes

- The scenario already includes startup sleeps because the seeded database needs time to become usable.
- `folder-destination: "/tmp/repo"` is used so the Puppeteer container can copy `puppeteer-flow.js`.
- If the task is about the browsing behavior, inspect `puppeteer-flow.js` before touching container definitions.
- This directory had no local doc before; use this file as the primary entry point.
