# Agent Guide

Scope: run a minimal WordPress site for comparison against the Hugo static variant.

## Scenarios

- `usage_scenario.yml`: current default `wordpress:latest` variant.
- `usage_scenario_5.9.3.yml`: pinned WordPress `5.9.3` variant.
- `usage_scenario_6.0.0.yml`: pinned WordPress `6.0.0` variant.

## Entry Files

- `usage_scenario.yml`
- `usage_scenario_5.9.3.yml`
- `usage_scenario_6.0.0.yml`
- `compose.yml`
- `Dockerfile`
- `wordpress-dump.sql`
- `wordpress.conf`

## Agent Notes

- Use the version-pinned scenarios for reproducible comparisons across WordPress releases.
- The seeded MariaDB container needs startup time; the default scenario includes sleeps for that reason.
- The family README notes that local measurements may require `--allow-unsafe`.
- This directory had no local README; use this file as the primary guide.
